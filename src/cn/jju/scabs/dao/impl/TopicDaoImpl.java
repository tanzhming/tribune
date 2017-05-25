package cn.jju.scabs.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.SessionFactory;

import cn.jju.scabs.dao.TopicDao;
import cn.jju.scabs.entity.Topic;
import cn.jju.scabs.entity.Type;
import cn.jju.scabs.entity.User;

public class TopicDaoImpl implements TopicDao{
	
	// IOC容器(依赖)注入SessionFactory对象
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 显示所有文章,按时间降序排列
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> getAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Topic order by time desc")
				.setFirstResult(0)
				.setMaxResults(6)
				.list();
	}

	/**
	 * 显示推荐文章，按时间降序排列
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> getAllTuiJian() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Topic where isTuiJian != 0 order by time desc")
				.list();
	}

	/**
	 *  根据主键查询
	 */
	@Override
	public Topic findById(int id) {
		return (Topic) sessionFactory.getCurrentSession().get(Topic.class, id);
	}

	/**
	 * 文章点赞
	 */
	@Override
	public void like(Topic topic) {
		sessionFactory.getCurrentSession()
				.createQuery("update Topic set good=? where id =?")
				.setParameter(0, topic.getGood())
				.setParameter(1, topic.getId())
				.executeUpdate();
	}

	/**
	 * 文章搜索
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> searchTopic(String title) {
		return sessionFactory.getCurrentSession()
				.createQuery("from Topic where title like ?")
				.setParameter(0, "%" + title + "%")
				.list();
	}

	/**
	 * 获得4条的推荐文章记录（按点赞的降序排列）
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> get4Notes() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Topic order by good desc")
				.setMaxResults(4)  //  获取四条记录
				.list();
	}

	/**
	 * 发布一条文章消息
	 */
	@Override
	public void save(Topic topic) {
		sessionFactory.getCurrentSession().save(topic);
	}

	/**
	 * 获得总记录数
	 */
	@Override
	public int getTotalCount() {
		Query q = sessionFactory.getCurrentSession().createQuery("from Topic");
		ScrollableResults scroll = q.scroll();
		scroll.last();
		int totalCount=scroll.getRowNumber()+1;
		q.list();
		return totalCount;   //  得到总记录数
	}

	/**
	 * 分页查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> getAll(int currentPage) {
		Query q = sessionFactory.getCurrentSession().createQuery("from Topic order by time desc");
		int index= (currentPage-1) * 6;  // 查询起始行
		q.setFirstResult(index);
		q.setMaxResults(6);
		return q.list();
	}

	/**
	 * 根据类型查找文章
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> findByType(Type type,int currentPage) {
		int index = (currentPage - 1) * 6; // 查询起始行
		// 使用sql查询
		return sessionFactory
				.getCurrentSession()
				.createSQLQuery(
						"select * from t_topic  where Ttyid = ? ORDER BY Ttime DESC limit ?,6")
				.addEntity(Topic.class)  //  封装  （sql查询必须要有这个方法）
				.setParameter(0, type.getId())
				.setParameter(1, index)
				.list();
	}

	/**
	 * 根据类型查找该类型的文章的总记录数(如：JSP类型的文章有4条记录)
	 */
	@Override
	public int getTotalCountByType(int id) {
		int totalCount=0;
		Object obj = sessionFactory.getCurrentSession()
				.createSQLQuery("select count(Tid) from t_topic where  Ttyid = ?")
				.setParameter(0, id)
				.uniqueResult();
		totalCount=Integer.valueOf(obj.toString());
		return totalCount;
	}

	/**
	 * 查询一个用户发表所有的文章
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> findTopicByUser(User user) {
		String hql = "from Topic where user=?";
		return sessionFactory.getCurrentSession()
				.createQuery(hql)
				.setParameter(0, user)
				.list();
	}
	
	/**
	 * 用户修改自己发表的一篇文章
	 */
	@Override
	public void editTopic(Topic topic) {
		String hql = "update Topic t set t.title=?,t.contents=?,t.type=?,t.time=? where id=?";
		sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, topic.getTitle())
				.setParameter(1, topic.getContents())
				.setParameter(2, topic.getType())
				.setParameter(3, topic.getTime())
				.setParameter(4, topic.getId())
				.executeUpdate();
	}

	/**
	 * 删除一篇文章
	 */
	@Override
	public void deleteTopic(Topic topic) {
		String hql = "delete from Topic where id=?";    // 解决外键引用删除不了的方法：在数据库中的外键字段设置级联
		sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, topic.getId()).executeUpdate();
	}
	

}











