package cn.jju.scabs.service.impl;

import java.util.List;

import cn.jju.scabs.dao.TopicDao;
import cn.jju.scabs.entity.Topic;
import cn.jju.scabs.entity.Type;
import cn.jju.scabs.entity.User;
import cn.jju.scabs.service.TopicService;

public class TopicServiceImpl implements TopicService{
	
	// IOC容器注入TopicDao对象
	private TopicDao topicDao;
	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

//	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception") 注解配置事务
	@Override
	public List<Topic> getAll() {
		return topicDao.getAll();
	}

	@Override
	public List<Topic> getAllTuiJian() {
		return topicDao.getAllTuiJian();
	}

	@Override
	public Topic findById(int id) {
		return topicDao.findById(id);
	}

	@Override
	public void like(Topic topic) {
		topicDao.like(topic);
	}

	/**
	 * 文章搜索
	 */
	@Override
	public List<Topic> searchTopic(String title) {
		return topicDao.searchTopic(title);
	}

	/**
	 * 获取4条推荐文章
	 */
	@Override
	public List<Topic> get4Notes() {
		return topicDao.get4Notes();
	}

	@Override
	public void save(Topic topic) {
		topicDao.save(topic);
	}

	/**
	 * 获得总记录数
	 */
	@Override
	public int getTotalCount() {
		return topicDao.getTotalCount();
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<Topic> getAll(int currentPage) {
		return topicDao.getAll(currentPage);
	}

	/**
	 * 根据类型查文章
	 */
	@Override
	public List<Topic> findByType(Type type,int currnrtPage) {
		return topicDao.findByType(type,currnrtPage);
	}

	/**
	 * 根据类型查找该类型的文章的总记录数(如：JSP类型的文章有4条记录)
	 */
	@Override
	public int getTotalByType(int id) {
		return topicDao.getTotalCountByType(id);
	}

	/**
	 * 查询一个用户发表的所有文章
	 */
	@Override
	public List<Topic> findTopicByUser(User user) {
		return topicDao.findTopicByUser(user);
	}

	/**
	 * 用户修改自己的文章
	 */
	@Override
	public void edit(Topic topic) {
		topicDao.editTopic(topic);
	}

	/**
	 * 删除一篇文章
	 */
	@Override
	public void deleteTopic(Topic topic) {
		topicDao.deleteTopic(topic);
	}

}
