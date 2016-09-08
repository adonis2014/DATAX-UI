package cn.uncode.schedule.core;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.UndeclaredThrowableException;

import net.iharding.Constants;

import org.springframework.util.ReflectionUtils;

public class ScheduledMethodRunnable implements Runnable {

	private final Object target;

	private final Method method;
	
	private final String params;
	
	private final long workerId;

	private  String result;
	
	private String log;

	public ScheduledMethodRunnable(Object target, Method method, String params,long workerId) {
		this.target = target;
		this.method = method;
		this.params = params;
		this.workerId=workerId;
		this.result=null;
		this.log=null;
	}

	public ScheduledMethodRunnable(Object target, String methodName, String params,long workerId) throws NoSuchMethodException {
		this.target = target;
		this.method = target.getClass().getMethod(methodName);
		this.params = params;
		this.workerId=workerId;
		this.result=null;
		this.log=null;
	}


	public Object getTarget() {
		return this.target;
	}

	public Method getMethod() {
		return this.method;
	}
	
	public String getParams() {
		return params;
	}
	
	public String getResult() {
		return result;
	}

	public long getWorkerId() {
		return workerId;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public void run() {
		try {
			ReflectionUtils.makeAccessible(this.method);
			if(this.getParams() != null){
				result=(String)this.method.invoke(this.target, this.getParams());
			}else{
				result=(String)this.method.invoke(this.target);
			}
			Method collectLog=target.getClass().getMethod("collectLog");
			log=(String)collectLog.invoke(this.target);
		}
		catch (InvocationTargetException ex) {
			ReflectionUtils.rethrowRuntimeException(ex.getTargetException());
			result=""+Constants.RET_SUCCESS;
		}
		catch (IllegalAccessException ex) {
			throw new UndeclaredThrowableException(ex);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
	}

}
