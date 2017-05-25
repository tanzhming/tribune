package cn.jju.scabs.service;

import java.util.List;

import cn.jju.scabs.entity.Reply;
import cn.jju.scabs.entity.Topic;

/**
 * 回复dao接口设计
 * @author dell
 *
 */
public interface ReplyService {

	/**
	 * 根据topic_id查询回复
	 */
	List<Reply> getAll(Topic topic);
	
	
	/**
	 * 根据Rtid查询回复的回复(查询一条回复下的所有回复)
	 */
	List<Reply> getAllComentsByTid(int id);
	
	/**
	 * 在一篇文章下增加一条回复
	 */
	void save(Reply reply);
	
}
