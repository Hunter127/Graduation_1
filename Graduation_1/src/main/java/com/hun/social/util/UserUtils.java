package com.hun.social.util;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hun.social.repositories.UserDao;

/**
 * HbaseTemplate接口是不能建表的，要手动获取配置建
 * 初始化建表，同时往里面添加管理员用户
 * @author huanghuiyuan
 *
 */
@Component
public class UserUtils implements InitializingBean{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserUtils.class);
	
	private String TABLENAME = "users";
	private String INFO = "info";
	private byte[] tableNameAsBytes = Bytes.toBytes("users");
	
	@Resource(name="hadoopConfiguration")
	private Configuration config;
	
	@Autowired
	private UserDao userDao;
	
	private Admin admin;
	
	public void initialize() throws IOException{
		if(admin.tableExists(TableName.valueOf(TABLENAME))){
			LOGGER.info("初始化加载表，表已经存在-------------------------------");
			return;
		}else{
		   admin = ConnectionFactory.createConnection(config).getAdmin();
		   HTableDescriptor hTableDescriptor = new HTableDescriptor(TableName.valueOf(TABLENAME));
		   HColumnDescriptor hColumnDescriptor = new HColumnDescriptor(INFO);
		   hColumnDescriptor.setMaxVersions(1);
		   hTableDescriptor.addFamily(hColumnDescriptor);
		   admin.createTable(hTableDescriptor);
		   LOGGER.info("初次加载，建表-------------------------------------------");
		   admin.close();
		}
		
	}
	
	public void addUser(){
		//userDao.add(u);
	}
	
	
	

	@Override
	public void afterPropertiesSet() throws Exception {
		/*initialize();*/
		
	}

}
