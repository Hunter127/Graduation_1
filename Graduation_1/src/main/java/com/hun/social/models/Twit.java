package com.hun.social.models;

import org.joda.time.DateTime;

public class Twit {
	
	private String username;
	private String content;
	private DateTime dt;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public DateTime getDt() {
		return dt;
	}
	/**
	 * 由秒转为时间
	 * @param dt
	 */
	public void setDt(Long l) {
		this.dt =  new DateTime(l);
	}
	public Twit(String username, String content, DateTime dt) {
		super();
		this.username = username;
		this.content = content;
		this.dt = dt;
	}
	public Twit() {
		super();
	}
	
	

}
