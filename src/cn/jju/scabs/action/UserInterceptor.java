package cn.jju.scabs.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// 获取当前执行的方法
		String methodName = invocation.getProxy().getMethod();
		
		// 获得ActionContext对象
		ActionContext ac = invocation.getInvocationContext();
		
		// 获取session，从session中获取登录的登录账号
		Object obj = ac.getSession().get("userInfo");
		
		// 对指定方法进行拦截
		if ("view_expressed".equals(methodName)) { // 对“发表”方法进行拦截
			// 判断 用户是否登录
			if (obj == null) {
				// 返回登录界面
				return "login";
			} else {
				// 放行
				return invocation.invoke();
			}
		} else {
			// 放行
			return invocation.invoke();
		}
	}

}
