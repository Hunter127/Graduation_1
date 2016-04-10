package com.hun.social.models;

/**
 * 关系模型
 * @author huanghuiyuan
 *
 */
public class Follow {
	
	private String user1;
	private String user2;
	private String fork_by;
	
	public String getUser1() {
		return user1;
	}
	public void setUser1(String user1) {
		this.user1 = user1;
	}
	public String getUser2() {
		return user2;
	}
	public void setUser2(String user2) {
		this.user2 = user2;
	}
	public String getFork_by() {
		return fork_by;
	}
	public void setFork_by(String fork_by) {
		this.fork_by = fork_by;
	}
	
	

}
