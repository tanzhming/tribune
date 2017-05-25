package cn.jju.scabs.test;

import org.junit.Test;

import cn.jju.scabs.dao.TopicDao;
import cn.jju.scabs.dao.impl.TopicDaoImpl;

public class TestApp {
	
	@Test
	public void TestApp(){
		TopicDao  topicDao = new TopicDaoImpl();
		int totalCount = topicDao.getTotalCount();
		System.out.println(totalCount);
		
	}
}
