package cn.jju.scabs.entity;

public class Topic {
	
	private int id;
	private String time;
	private String title;
	private String contents;
	private int isTuiJian;
	private int good;
	
	private Type type;
	private User user;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getIsTuiJian() {
		return isTuiJian;
	}
	public void setIsTuiJian(int isTuiJian) {
		this.isTuiJian = isTuiJian;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Topic [id=" + id + ", time=" + time + ", title=" + title
				+ ", contents=" + contents + ", isTuiJian=" + isTuiJian
				+ ", good=" + good + ", type=" + type + ", user=" + user + "]";
	}
	
	
}
