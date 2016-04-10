package com.hun.social.repositories;

import java.util.List;

import com.hun.social.models.Follow;

/**
 * A关注了B，B也关注了A：那么他们就是好友关系，这些细节可以对上层隐藏。
 * 
 * 
 * A关注了谁
 * 谁关注了A
 *  用户 A 登陆，访问用户 B 的推特，那么需要知道用户 A 有没有关注用户 B ？ 
 * @author huanghuiyuan
 *
 *  rowKey:MD5( 用户 A)+ 关注 +MD5( 用户 B)#1: 用户 B 的昵称 
 *  rowKey:MD5( 用户 A)+ 关注 +MD5( 用户 C)#1: 用户 C 的昵称 
 *  rowKey:MD5( 用户 A)+ 被关注 +MD5( 用户 D)#1: 用户 D 的昵称 
 *  rowKey:MD5( 用户 A)+ 被关注 +MD5( 用户 H)#1: 用户 H 的昵称 
 *
 */
public interface FollowsDao {
	/**
	 * 获取某人关注的所有人或者 获取所有关注某人的所有用户
	 * @param string
	 * @return
	 */
	public List<String> getUser_to(String string,String fork_Or_Byfork);
	/**
	 * 增加关系：关注或被关注
	 * @param user0
	 * @param user1
	 * @param fork_Or_Byfork
	 * @return
	 */
	public Boolean add_follow(Follow f);
	

}
