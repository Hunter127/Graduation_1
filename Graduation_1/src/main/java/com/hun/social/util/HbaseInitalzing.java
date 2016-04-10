package com.hun.social.util;

import java.io.IOException;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hun.social.repositories.UserDao;
/**
 * 项目Hbase表加速加载
 * @author hun
 * @Description: TODO
 * @date 2016年4月4日 下午12:14:40
 */
@Component
public class HbaseInitalzing implements InitializingBean {
	
	@Autowired
	private UserDao userDao;
	
	private void initialize() throws IOException{
		userDao.check("admin");
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		initialize();

	}

}
