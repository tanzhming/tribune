package cn.jju.scabs.service.impl;

import java.util.List;

import cn.jju.scabs.dao.ReplyDao;
import cn.jju.scabs.entity.Reply;
import cn.jju.scabs.entity.Topic;
import cn.jju.scabs.service.ReplyService;

public class ReplyServiceImpl implements ReplyService{
	
	//IOC容器注入ReplyDao
	private ReplyDao replyDao;
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public List<Reply> getAll(Topic topic) {
		return replyDao.getAll(topic);
	}

	/**
	 * 根据Rtid查询回复的回复(查询一条回复下的所有回复)
	 */
	@Override
	public List<Reply> getAllComentsByTid(int id) {
		return replyDao.getAllComentsByTid(id);
	}

	/**
	 * 在一篇文章下增加一条回复
	 */
	@Override
	public void save(Reply reply) {
		replyDao.save(reply);
	}


}
