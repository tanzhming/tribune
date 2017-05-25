package cn.jju.scabs.dao;

import cn.jju.scabs.entity.User;

/**
 * 用户模块dao接口设计
 * @author dell
 *
 */
public interface UserDao {

	/**
	 * 保存
	 */
	void save(User user);
	
	/**
	 * 根据用户信息查询
	 * @param user  
	 * @return 返回查询到的用户信息
	 */
	User findByUser(User user);
	
	/**
	 * 查询是否存在该用户
	 */
	User findUser(User user);
	
	/**
	 * 用户修个人信息
	 */
	void updateMyInfo(User user);
	
	/**
	 * 用户修改密码
	 */
	void updatePwd(User user,String newPwd);
}
