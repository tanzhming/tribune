package cn.jju.scabs.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import cn.jju.scabs.entity.User;
import cn.jju.scabs.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户模块控制层  (模型驱动)
 * @author dell
 *
 */
public class UserAction extends ActionSupport implements ModelDriven<User>,RequestAware{

	// IOC容器注入UserService
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 封装数据 -----
	private User user = new User();

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}
	
	/**
	 * 登录
	 */
	public String login() {
		
		User userInfo = userService.findByUser(user);
		
		if(userInfo==null){
			// 登录失败
			// 提示错误信息
			request.put("errorInfo", "用户名密码错误");
			
			return "loginFaild";
		}else{
			// 登录成功
			// 保存到session
			ActionContext.getContext().getSession().put("userInfo", userInfo);
			
			return "index";
		}
	}
	
	/**
	 *  退出
	 */
	public String exit() {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		session.removeAttribute("userInfo");
		
		return "exit";
	}
	
	/**
	 * 注册
	 */
	public String register() {
		
		User u = userService.findUser(user);
		System.out.println("action"+u);
		if(u==null){
			// 不存在该用户，注册成功,返回登录界面
			System.out.println("User------"+user);
			userService.save(user);
			
			return "registerSuccess";
		}else {
			// 存在该用户，返回注册界面，继续注册
			// 存在该用户，不可以增加一条用户记录
			
			return "registerFaild";
		}
		
	}
	
	
	/**
	 * 进入个人信息页面
	 */
	public String showMyInfo() {
		return "viewMyInfo";
	}

	/**
	 * 修改个人信息
	 */
	public String updateInfo(){
		
		userService.updateMyInfo(user);
		
		return "updateSuccess";
	}
	
	/**
	 * 用户修改个人登录密码
	 * @return
	 */
	public String updatePwd() {
		
		String newPwd = ServletActionContext.getRequest().getParameter("newpass");
		User u = userService.findByUser(user);
		if(u!=null){  // 用户输入的旧密码输入正确
			userService.updatePwd(user, newPwd); 
			return "updateSuccess";  // 返回到首页
		}else {
			// 输入的旧密码不正确
			return "updateError";   // 返回错误提示页面
		}
	}
	
}









