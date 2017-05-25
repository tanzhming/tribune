package cn.jju.scabs.entity;

import java.util.Date;

public class Reply {

	private int id;
	private String contents;
	private Date time;
	
	private Reply reply;
	private Topic topic;
	private User user;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Reply [id=" + id + ", contents=" + contents + ", time=" + time
				+ ", reply=" + reply + ", topic=" + topic + ", user=" + user
				+ "]";
	}
}
