package cn.jju.scabs.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import cn.jju.scabs.entity.Reply;
import cn.jju.scabs.entity.Topic;
import cn.jju.scabs.entity.Type;
import cn.jju.scabs.entity.User;
import cn.jju.scabs.service.ReplyService;
import cn.jju.scabs.service.TopicService;
import cn.jju.scabs.service.TypeService;
import cn.jju.scabs.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 *  采用模型驱动封装数据
 * @author dell
 *
 */
public class TopicAction extends ActionSupport implements ModelDriven<Topic>,RequestAware{

	// 封装数据
	private Topic topic = new Topic();

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Topic getTopic() {
		return topic;
	}

	@Override
	public Topic getModel() {
		return topic; // 返回实例化后的对象
	}

	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	// 注入TopicService    ----------------------
	private TopicService topicService;
	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}
	// 注入用户Service(UserService) ------------------ 
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	// 注入文章类型Service（TuypeService）--------------
	private TypeService typeService;
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	// 注入回复Service（ReplyService）--------------------
	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	
	/**
	 * 显示推荐文章
	 */
	public String listTuiJian() {
		
		List<Topic> listTuiJian = topicService.getAllTuiJian();
		
		// 保存到request中
		request.put("listTuiJian", listTuiJian);
		
		return "listTuiJian";
	}
	
	/**
	 * 显示最新文章
	 */
	public String listAll() {
		
		int currentPage = Integer.parseInt(ServletActionContext.getRequest().getParameter("currentPage"));
		
		
		List<Topic> listall = topicService.getAll(currentPage);
		

		int totalCount = topicService.getTotalCount();   //  获得总记录数
		int totalPage = 1;  // 总页数  (默认为1页)
		
		if (totalCount % 6 == 0) {
			totalPage = totalCount / 6;
		} else {
			totalPage = (totalCount / 6) + 1;
		}
		
		// 保存到request中
		request.put("listall",listall);
		request.put("totalPage", totalPage);  //保存总页数
		request.put("currentPage", currentPage);  // 保存当前页
		
		return listTuiJian();
	}
	
	/**
	 * 显示所有文章类型
	 */
	public String listAllType() {
		
		List<Type> listTypes = typeService.getAll();
		
		// 保存到request
//		request.put("listTypes", listTypes);
		ActionContext.getContext().getSession().put("listTypes", listTypes);
		
		return listAll();
	}
	
	/**
	 * 进入显示文章信息的页面
	 */
	public String viewTopicInfo() {
		int id=topic.getId();
		
		// 根据主键查询文章信息
		Topic topicInfo = topicService.findById(id);
		// 查询所有的文章类型
		List<Type> listType = typeService.getAll();
		
		// 保存
		request.put("topicInfo", topicInfo);
		request.put("listType", listType);
		return reply();
	}
	
	/**
	 * 文章点赞
	 */
	public String like(){
		
		int id = topic.getId();
		
		// 查询文章的点赞个数然后在把数量+1封装到topic中
		Topic tp = topicService.findById(id);
		int good = tp.getGood()+1;
		topic.setGood(good);
		
		topicService.like(topic);
		
		return viewTopicInfo();
	}
	
	/**
	 * 显示文章的评论
	 */
	public String reply() {
		List<Reply> listReplys = replyService.getAll(topic);
//		System.out.println("输出测试-----------ID="+topic.getId()+"----------------");
//		List<Reply> listcoments=replyService.getAllComentsByTid(topic.getId());
		
		// request保存
		request.put("listReplys", listReplys);
//		request.put("listcoments", listcoments);
//		System.out.println("输出测试-----------listcoments.contents+"+listcoments.get(0).getContents());
		
		return get4Notes();
	}
	
	/**
	 * 显示文章列表---进入文章列表页面
	 */
	public String view_articles() {
		int currentPage = Integer.parseInt(ServletActionContext.getRequest().getParameter("currentPage"));
		List<Topic> listArticles = topicService.getAll(currentPage);
		List<Topic> list4Notes = topicService.get4Notes();
		
		int totalCount = topicService.getTotalCount();   //  获得总记录数
		int totalPage = 1;  // 总页数  (默认为1页)
		
		if (totalCount % 6 == 0) {
			totalPage = totalCount / 6;
		} else {
			totalPage = (totalCount / 6) + 1;
		}
		
		// 保存request
		request.put("listArticles", listArticles);
		request.put("list4Notes", list4Notes);
		request.put("totalPage", totalPage);  //保存总页数
		request.put("currentPage", currentPage);  // 保存当前页
		
		return "articles";
	}
	
	/**
	 * 文章搜索
	 */
	public String search() {
		String title = ServletActionContext.getRequest().getParameter("title");
		List<Topic> searchTopic = topicService.searchTopic(title);
		List<Topic> list4Notes = topicService.get4Notes();
		// request 保存
		request.put("searchTopic", searchTopic);
		request.put("list4Notes", list4Notes);
		
		return "searchTopic";
	}
	
	/**
	 * 获取4条推荐文章
	 */
	public String get4Notes() {
		
		List<Topic> list4Notes = topicService.get4Notes();
		
		// 保存 
		request.put("list4Notes", list4Notes);
		
		return "viewTopicInfo";
	}
	
	/**
	 * 发表文章---------显示文章发表页面
	 */
	public String view_expressed() {

		List<Topic> list4Notes = topicService.get4Notes();

		// 保存
		request.put("list4Notes", list4Notes);
		
		
		return "view_expressed";
	}
	
	/**
	 * 发表文章--------发表
	 */
	public String addTopic() {
		// 数据封装----------
		int uId = Integer.parseInt(ServletActionContext.getRequest().getParameter("Tuid"));
		int tyId = Integer.parseInt(ServletActionContext.getRequest().getParameter("tyId"));
		User  user =new User();
		user.setId(uId);
		Type type=new Type();
		type.setId(tyId);
		topic.setUser(user);
		topic.setType(type);
		// 封装数据结束
		
		topicService.save(topic);
		
		return "addSuccess";
	}
	
	/**
	 * 根据类型查文章
	 */
	public String view_ByType() {
		int currentPage = Integer.parseInt(ServletActionContext.getRequest().getParameter("currentPage"));
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		request.put("id", id);
		Type type=new Type();
		type.setId(id);
		List<Topic> listByType = topicService.findByType(type,currentPage);
		
		int totalCount = topicService.getTotalByType(id);   //  获得该类型的文章总记录数（如：JSP类型的文章有4条记录）
		int totalPage = 1;  // 总页数  (默认为1页)
		
		if (totalCount % 6 == 0) {
			totalPage = totalCount / 6;
		} else {
			totalPage = (totalCount / 6) + 1;
		}
		
		// 保存
		request.put("listByType", listByType);
		request.put("totalPage", totalPage);  //保存总页数
		request.put("currentPage", currentPage);  // 保存当前页
		
		return "listByType";
	}

	/**
	 * 查询一个用户发表的所有文章并在页面显示出来
	 * @return
	 */
	public String findTopicByUser() {
		
		User user = (User) ActionContext.getContext().getSession().get("userInfo");
		
		List<Topic> listTopicByUser = topicService.findTopicByUser(user);
		
		// 保存到session中
		ActionContext.getContext().getSession().put("listTopicByUser", listTopicByUser);
		
		return "view_myTopic";  // 进入“我的文章管理页面”
	}
	
	/**
	 * 用户修改自己发布的文章--进入修改页面
	 */
	public String vieweditTopic() {
		
		Topic tp = topicService.findById(topic.getId());
		
		// session保存 
		ActionContext.getContext().getSession().put("tp", tp);
		
		return "view_editTopic";
	}
	
	/**
	 * 用户修改自己发布的文章
	 * @return
	 */
	public String editTopic() {
		
		int typeId = Integer.parseInt(ServletActionContext.getRequest().getParameter("typeId"));
		Type type = new Type();
		type.setId(typeId);
		// 获取当前时间
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sf.format(new Date());
		topic.setTime(time);
		topic.setType(type);
		
		topicService.edit(topic);
		
		return findTopicByUser();
	}
	
	public String deleteTopic() {
		
		topicService.deleteTopic(topic);
		
		return findTopicByUser();
	}
	
}












