package cn.jju.scabs.entity;


public class User {

	private int id;
	private String loginName;
	private String name;
	private String pwd;
	private String sex;
	private String email;
	private String tel;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", name=" + name
				+ ", pwd=" + pwd + ", sex=" + sex + ", email=" + email
				+ ", tel=" + tel + "]";
	}
	
	
	
}
