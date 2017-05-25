package cn.jju.scabs.service.impl;

import cn.jju.scabs.dao.UserDao;
import cn.jju.scabs.entity.User;
import cn.jju.scabs.service.UserService;

public class UserServiceImpl implements UserService{
	
	// IOC容器注入UserDao对象
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 保存
	 */
	@Override
	public void save(User user) {
		userDao.save(user);
	}

	/**
	 * 根据用户名和密码查询用户
	 */
	@Override
	public User findByUser(User user) {
		return userDao.findByUser(user);
	}

	
	/**
	 * 先查询数据库是否存在该用户，如果没有，则向数据库插入数据；如果有，则返回“该用户已经存在，请重新注册”提示.
	 */
	@Override
	public User findUser(User user) {
		
		User u = userDao.findByUser(user);
		System.out.println("Service"+u);
		return u;
	}

	/**
	 * 用户修改个人信息
	 */
	@Override
	public void updateMyInfo(User user) {
		userDao.updateMyInfo(user);
	}

	/**
	 * 用户修改密码--先判断用户输入的旧密码是否正确，如果正确则执行修改操作;如果不正确，则修改不成功
	 */
	@Override
	public void updatePwd(User user,String newPwd) {
		userDao.updatePwd(user, newPwd);
	}

	
}













