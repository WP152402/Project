package org.dimigo.vo;

public class UserVO {
	private String id;
	private String pwd;
	private String nickname;
	private String name;
	public UserVO() {
		
	}
	public UserVO(String id, String nickname, String name) {
		this.id = id;
		this.nickname = nickname;
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pwd=" + pwd + ", nickname=" + nickname + ", name=" + name + "]";
	}
	
	
}
