package com.hun.social.repositories;

import com.hun.social.models.User;
/**
 * 这个表就是解决存储用户所有信息问题
 * @author huanghuiyuan
 *
 */
public interface UserDao {
	public Boolean add(User u);
	/**
	 * 删除用户这个功能，一般用不上
	 * @param userID
	 */
	public void delete(String userID);
	/**
	 * 登录用
	 * @param u
	 * @return
	 */
	public User getUser(User u);
	
	public Boolean update(User u);
	
	public Boolean check(String username);

}
