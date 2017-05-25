package cn.jju.scabs.action;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import cn.jju.scabs.entity.Reply;
import cn.jju.scabs.entity.Topic;
import cn.jju.scabs.entity.User;
import cn.jju.scabs.service.ReplyService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReplyAction extends ActionSupport implements ModelDriven<Reply>,RequestAware{
	
	// 封装数据
	private Reply reply = new Reply();

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	@Override
	public Reply getModel() {
		return reply;
	}
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	// IOC 容器（依赖注入）
	private ReplyService replyService ;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	int topicId ; //获取文章的信息
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public String addReply() {
		User user = (User) ActionContext.getContext().getSession().get("userInfo");   // 获取登录的用户信息
		topicId = Integer.parseInt(ServletActionContext.getRequest().getParameter("topicId")); //获取文章的信息
		// 封装数据
		Topic topic = new Topic();
		topic.setId(topicId);
		// --  封装数据
		reply.setUser(user);
		reply.setTopic(topic);
		
		replyService.save(reply);
		
		return "addOk";
	}

}
