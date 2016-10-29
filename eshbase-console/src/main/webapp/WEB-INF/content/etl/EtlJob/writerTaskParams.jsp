<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
													<table width="100%" class="dbgrid">
														<thead>
															<tr>
																<th>插件参数ID</th>
																<th>参数Key</th>
																<th>参数值</th>
																<th>备注</th>
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${obj.taskParams}" var="tparam">
														<tr>
															<td>${tparam.pluginParamId}</td>
															<td>${tparam.paramKey}</td>
															<td><input type="text" name="w_paramValue_${tparam.paramKey}" value="${tparam.paramValue}"/></td>
															<td><input type="text" name="w_paramRemark_${tparam.paramKey}" value="${tparam.remark}"/></td>
														</tr>
														</c:forEach>
														</tbody>
													</table>