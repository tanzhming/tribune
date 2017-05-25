package cn.jju.scabs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;

import cn.jju.scabs.dao.TypeDao;
import cn.jju.scabs.entity.Type;

public class TypeDaoImpl implements TypeDao{
	
	// IOC容器（依赖）注入SessionFactory对象
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 查询所有的文章类型
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Type> getAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Type")
				.list();
	}

}
