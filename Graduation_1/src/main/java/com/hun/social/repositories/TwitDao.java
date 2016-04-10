package com.hun.social.repositories;

import java.util.List;

import com.hun.social.models.Twit;

/**
 * 这个表是解决找到指定用户的所有推文
 * @author huanghuiyuan
 *rowKey:MD5( 用户 A)+ 倒序时间戳 #time: 发帖时间， context: 内容
 */
public interface TwitDao {

	/**
	 * 找到指定用户的所有推文
	 * @return
	 */
	public List<Twit> get_List_Twit(String userID);
	
	/**
	 * 增加一条推文
	 * @param t
	 */
	public Boolean add(Twit t);
}
