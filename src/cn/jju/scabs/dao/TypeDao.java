package cn.jju.scabs.dao;

import java.util.List;

import cn.jju.scabs.entity.Type;

/**
 * 文章类型dao接口设计
 * @author dell
 *
 */
public interface TypeDao {

	/**
	 * 查询所有文章类型
	 */
	List<Type> getAll();
	
	
}
