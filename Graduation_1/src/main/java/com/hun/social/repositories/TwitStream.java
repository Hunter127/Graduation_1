package com.hun.social.repositories;
/**
 * 每一个用户维护一个推特流，一旦某一个人写了推特，就将这个内容写入到关注他的人的推特流里面。
 * 这就是反规范化
 * @author huanghuiyuan
 *rowKey:MD5( 用户 A)+ 倒序时间戳 # 用户 B 的昵称：推贴内容
 *rowKey:MD5( 用户 A)+ 倒序时间戳 # 用户 D 的昵称：推贴内容 
 *rowKey:MD5( 用户 A)+ 倒序时间戳 # 用户 H 的昵称：推贴内容 
 */
public interface TwitStream {

}
