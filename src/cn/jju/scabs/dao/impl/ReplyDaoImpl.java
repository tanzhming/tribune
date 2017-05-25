package cn.jju.scabs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;

import cn.jju.scabs.dao.ReplyDao;
import cn.jju.scabs.entity.Reply;
import cn.jju.scabs.entity.Topic;

public class ReplyDaoImpl implements ReplyDao{

	// IOC容器（依赖）注入SessionFactory对象
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Reply> getAll(Topic topic) {
//		return sessionFactory.getCurrentSession()
//				.createQuery("from Reply where topic=?")
//				.setParameter(0, topic)
//				.list();
		return sessionFactory.getCurrentSession()
				.createSQLQuery("select * from t_reply where Rtid = ? ORDER BY Rtime DESC")
				.addEntity(Reply.class)
				.setParameter(0, topic.getId())
				.list();
	}

	/**
	 * 根据Rtid查询回复的回复(查询一条回复下的所有回复)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Reply> getAllComentsByTid(int id) {
		// 回复的回复
		return sessionFactory
				.getCurrentSession()
				.createSQLQuery(
						"select *  from t_reply a LEFT OUTER join  t_reply b on a.Rid=b.Rrid where a.Rtid=? and !ISNULL(b.RRid)")
				.addEntity(Reply.class)
				.setParameter(0, id)
				.list();
	}

	/**
	 * 在一篇文章下增加一条回复
	 */
	@Override
	public void save(Reply reply) {
		sessionFactory.getCurrentSession().save(reply);
	}

}










