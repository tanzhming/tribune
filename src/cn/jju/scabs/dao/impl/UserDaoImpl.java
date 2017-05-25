package cn.jju.scabs.dao.impl;

import org.hibernate.SessionFactory;

import cn.jju.scabs.dao.UserDao;
import cn.jju.scabs.entity.User;

public class UserDaoImpl implements UserDao{
	
	// IOC容器（依赖）注入SessionFactory对象
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 保存
	 */
	@Override
	public void save(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	/**
	 * 根据用户名和密码查询
	 */
	@Override
	public User findByUser(User user) {
		return (User) sessionFactory.getCurrentSession()
				.createQuery("from User where loginName = ? and pwd = ?")
				.setParameter(0, user.getLoginName())
				.setParameter(1, user.getPwd())
				.uniqueResult();
	}

	@Override
	public User findUser(User user) {
		return (User) sessionFactory.getCurrentSession()
				.createQuery("from User where loginName = ?")
				.setParameter(0, user.getLoginName())
				.uniqueResult();
	}

	/**
	 * 用户修改个人信息
	 */
	@Override
	public void updateMyInfo(User user) {
		String hql = "update User set name=?,sex=?,tel=?,email=? where id=?";
		sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, user.getName())
				.setParameter(1, user.getSex())
				.setParameter(2, user.getTel())
				.setParameter(3, user.getEmail())
				.setParameter(4, user.getId())
				.executeUpdate();
	}

	/**
	 * 用户修改密码
	 */
	@Override
	public void updatePwd(User user,String newPwd) {
		String hql = "update User set pwd = ? where id = ?";
		sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, newPwd)
				.setParameter(1, user.getId())
				.executeUpdate();
	}

}











