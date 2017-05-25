package cn.jju.scabs.service;

import java.util.List;

import cn.jju.scabs.entity.Type;

/**
 * 文章类型业务逻辑层接口设计
 * @author dell
 *
 */
public interface TypeService {

	/**
	 * 查询所有文章类型
	 */
	List<Type> getAll();
	
	
}
