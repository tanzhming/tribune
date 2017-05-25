package cn.jju.scabs.service.impl;

import java.util.List;

import cn.jju.scabs.dao.TypeDao;
import cn.jju.scabs.entity.Type;
import cn.jju.scabs.service.TypeService;

public class TypeServiceImpl implements TypeService{
	
	// IOC容器注入TypeDao对象
	private TypeDao typeDao;
	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}

	@Override
	public List<Type> getAll() {
		return typeDao.getAll();
	}

}
