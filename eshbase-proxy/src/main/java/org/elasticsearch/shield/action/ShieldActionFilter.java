/*** Eclipse Class Decompiler plugin, copyright (c) 2016 Chen Chao (cnfree2000@hotmail.com) ***/
package org.elasticsearch.shield.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.elasticsearch.action.ActionListener;
import org.elasticsearch.action.ActionRequest;
import org.elasticsearch.action.ActionResponse;
import org.elasticsearch.action.search.ClearScrollRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchScrollRequest;
import org.elasticsearch.action.support.ActionFilter;
import org.elasticsearch.action.support.ActionFilterChain;
import org.elasticsearch.common.component.AbstractComponent;
import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.shield.InternalSystemUser;
import org.elasticsearch.shield.User;
import org.elasticsearch.shield.action.interceptor.RequestInterceptor;
import org.elasticsearch.shield.audit.AuditTrail;
import org.elasticsearch.shield.authc.AuthenticationService;
import org.elasticsearch.shield.authz.AuthorizationService;
import org.elasticsearch.shield.authz.Privilege;
import org.elasticsearch.shield.crypto.CryptoService;
import org.elasticsearch.shield.license.ShieldLicenseState;
import org.elasticsearch.shield.support.Exceptions;
import org.elasticsearch.tasks.Task;

import com.google.common.base.Predicate;

public class ShieldActionFilter extends AbstractComponent implements ActionFilter {
	private static final Predicate<String> LICENSE_EXPIRATION_ACTION_MATCHER = Privilege.HEALTH_AND_STATS.predicate();
	private final AuthenticationService authcService;
	private final AuthorizationService authzService;
	private final CryptoService cryptoService;
	private final AuditTrail auditTrail;
	private final ShieldActionMapper actionMapper;
	private final Set<RequestInterceptor> requestInterceptors;
	private final ShieldLicenseState licenseState;

	@Inject
	public ShieldActionFilter(Settings settings, AuthenticationService authcService, AuthorizationService authzService,
			CryptoService cryptoService, AuditTrail auditTrail, ShieldLicenseState licenseState,
			ShieldActionMapper actionMapper, Set<RequestInterceptor> requestInterceptors) {
		super(settings);
		this.authcService = authcService;
		this.authzService = authzService;
		this.cryptoService = cryptoService;
		this.auditTrail = auditTrail;
		this.actionMapper = actionMapper;
		this.licenseState = licenseState;
		this.requestInterceptors = requestInterceptors;
	}

	public void apply(Task task, String action, ActionRequest request, ActionListener listener,
			ActionFilterChain chain) {
//		if ((!(this.licenseState.statsAndHealthEnabled())) && (LICENSE_EXPIRATION_ACTION_MATCHER.apply(action))) {
//			this.logger.error(
//					"blocking [{}] operation due to expired license. Cluster health, cluster stats and indices stats \noperations are blocked on shield license expiration. All data operations (read and write) continue to work. \nIf you have a new license, please update it. Otherwise, please reach out to your support contact.",
//					new Object[] { action });
//
//			throw LicenseUtils.newComplianceException("shield");
//		}
		try {
			if (this.licenseState.securityEnabled()) {
				if (action.indexOf("bulk")>=0){
					chain.proceed(task, action, request, new SigningListener(this, listener));
					return;
				}
				String shieldAction = this.actionMapper.action(action, request);
				User user = this.authcService.authenticate(shieldAction, request, InternalSystemUser.INSTANCE);
//				if (hasRole(user.roles()) && request instanceof BulkRequest){
//					
//				}		
				this.authzService.authorize(user, shieldAction, request);
				request = unsign(user, shieldAction, request);

				for (RequestInterceptor interceptor : this.requestInterceptors) {
					if (interceptor.supports(request)) {
						interceptor.intercept(request, user);
					}
				}
				chain.proceed(task, action, request, new SigningListener(this, listener));
			} else {
				chain.proceed(task, action, request, listener);
			}
		} catch (Throwable t) {
			listener.onFailure(t);
		}
	}
	
	private  boolean hasRole(String[] roles){
		for(String role:roles){
			if ("__indexing_audit_role".equalsIgnoreCase(role)||"bulkrole".equalsIgnoreCase(role)){
				return true;
			}
		}
		return false;
	}

	public void apply(String action, ActionResponse response, ActionListener listener, ActionFilterChain chain) {
		chain.proceed(action, response, listener);
	}

	public int order() {
		return -2147483648;
	}

	<Request extends ActionRequest> Request unsign(User user, String action, Request request) {
		try {
			if (request instanceof SearchScrollRequest) {
				SearchScrollRequest scrollRequest = (SearchScrollRequest) request;
				String scrollId = scrollRequest.scrollId();
				scrollRequest.scrollId(this.cryptoService.unsignAndVerify(scrollId));
				return request;
			}

			if (request instanceof ClearScrollRequest) {
				ClearScrollRequest clearScrollRequest = (ClearScrollRequest) request;
				boolean isClearAllScrollRequest = clearScrollRequest.scrollIds().contains("_all");
				if (!(isClearAllScrollRequest)) {
					List<String> signedIds = clearScrollRequest.scrollIds();
					List<String> unsignedIds = new ArrayList<String>(signedIds.size());
					for (String signedId : signedIds) {
						unsignedIds.add(this.cryptoService.unsignAndVerify(signedId));
					}
					clearScrollRequest.scrollIds(unsignedIds);
				}
				return request;
			}

			return request;
		} catch (java.lang.IllegalArgumentException e) {
			this.auditTrail.tamperedRequest(user, action, request);
			throw Exceptions.authorizationError("invalid request. {}", new Object[] { e.getMessage() });
		}
	}

	<Response extends ActionResponse> Response sign(Response response) throws IOException {
		if (response instanceof SearchResponse) {
			SearchResponse searchResponse = (SearchResponse) response;
			String scrollId = searchResponse.getScrollId();
			if ((scrollId != null) && (!(this.cryptoService.signed(scrollId)))) {
				searchResponse.scrollId(this.cryptoService.sign(scrollId));
			}
			return response;
		}

		return response;
	}

	static class SigningListener<Response extends ActionResponse> implements ActionListener<Response> {
		private final ShieldActionFilter filter;
		private final ActionListener innerListener;

		private SigningListener(ShieldActionFilter filter, ActionListener innerListener) {
			this.filter = filter;
			this.innerListener = innerListener;
		}

		public void onResponse(Response response) {
			try {
				response = this.filter.sign(response);
				this.innerListener.onResponse(response);
			} catch (IOException e) {
				onFailure(e);
			}
		}

		public void onFailure(Throwable e) {
			this.innerListener.onFailure(e);
		}
	}
}