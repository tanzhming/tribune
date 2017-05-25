package cn.jju.scabs.dao;

import java.util.List;

import cn.jju.scabs.entity.Topic;
import cn.jju.scabs.entity.Type;
import cn.jju.scabs.entity.User;

/**
 * 文章模块dao接口设计
 * @author dell
 *
 */
public interface TopicDao {

	/**
	 * 显示最新文章，按时间降序排列
	 */
	public List<Topic> getAll();
	
	/**
	 * 显示推荐文章，按时间降序排列
	 */
	public List<Topic> getAllTuiJian();
	
	/**
	 * 根据主键查询
	 */
	Topic findById(int id);
	
	/**
	 * 文章点赞
	 */
	void like(Topic topic);
	
	/**
	 * 文章搜索
	 */
	List<Topic> searchTopic(String title);
	
	/**
	 * 获取4条记录，按点赞的降序排列
	 */
	List<Topic> get4Notes();
	
	/**
	 * 发布一条文章消息
	 */
	void save(Topic topic);
	
	/**
	 * 获得总记录数
	 */
	int getTotalCount();
	
	/**
	 * 分页查询
	 */
	List<Topic> getAll(int currentPage);
	
	/**
	 * 根据类型查文章
	 */
	List<Topic> findByType(Type type,int currentPage);
	
	/**
	 * 根据类型查找该类型的文章的总记录数(如：JSP类型的文章有4条记录)
	 */
	int getTotalCountByType(int id);
	
	/**
	 * 查询一个用户发表的所有文章
	 */
	List<Topic> findTopicByUser(User user);
	
	/**
	 * 用户修改自己发表的文章
	 */
	public void editTopic(Topic topic);
	
	/**
	 * 删除文章
	 */
	public void deleteTopic(Topic topic);
}
