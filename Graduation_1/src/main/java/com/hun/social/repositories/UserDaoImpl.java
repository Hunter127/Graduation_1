package com.hun.social.repositories;

import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.ResultsExtractor;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.data.hadoop.hbase.TableCallback;
import org.springframework.stereotype.Repository;

import com.hun.social.models.User;
import com.hun.social.util.Content;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	private final static Logger LOG = LoggerFactory.getLogger(UserDaoImpl.class);
	
	@Autowired
	@Qualifier("hbaseTemplate")
	private HbaseTemplate hTemplate;
 
	@Override
	public Boolean add(final User u) {
		return hTemplate.execute(Content.USER_TABLE, new TableCallback<Boolean>(){

			@Override
			public Boolean doInTable(HTableInterface table) throws Throwable {
				Put p = new Put(Bytes.toBytes(u.getUserId()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_NAME), Bytes.toBytes(u.getUserName()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_PASSWORD), Bytes.toBytes(u.getPassword()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_EMAIL), Bytes.toBytes(u.getEmail()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_NUM), Bytes.toBytes(u.getNum()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_QQ), Bytes.toBytes(u.getQq()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_TEL), Bytes.toBytes(u.getTel()));
				table.put(p);
				LOG.info("注册结果"+true);
				return true;
			}
			
		});

	}

	@Override
	public void delete(String userID) {
		// TODO Auto-generated method stub

	}

	/**
	 * 过滤所有用户，
	 * 常用的一些过滤方法：
	 * 提取以rowkey01结尾的数据
	 * Filter filter = new RowFilter(CompareFilter.CompareOp.EQUAL,new RegexStringComparator(".*01$"));
	 * 提取rowkey包含201407的数据
	 * Filter filter = new RowFilter(CompareFilter.CompareOp.EQUAL,new SubstringComparator("201407"));
	 * 提取rowkey以123开头的数据
	 * Filter filter = new RowFilter(CompareFilter.CompareOp.EQUAL,new BinaryPrefixComparator("123".getBytes()));
	 */
	@Override
	public User getUser(final User u) {
		Scan scan = new Scan();
		scan.addFamily(Bytes.toBytes(Content.USER_TABLE_INFO));
		
		Filter filter = new RowFilter(CompareFilter.CompareOp.EQUAL,new BinaryComparator(Bytes.toBytes(u.getUserId())));
		scan.setFilter(filter);
		
		
		User user = hTemplate.find(Content.USER_TABLE, scan, new ResultsExtractor<User>(){

			@Override
			public User extractData(ResultScanner results) throws Exception {
				for (Result result : results) {
					if(Bytes.toString(result.getValue(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_PASSWORD))).equals(u.getPassword())){
						return new User(Bytes.toString(result.getRow()),Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO),Bytes.toBytes(Content.Q_USER_NAME))),
								Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO),Bytes.toBytes(Content.Q_USER_PASSWORD))), 
								Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO),Bytes.toBytes(Content.Q_USER_EMAIL))),
								Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO),Bytes.toBytes(Content.Q_USER_NUM))),
								Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO),Bytes.toBytes(Content.Q_USER_TEL))),
								Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO),Bytes.toBytes(Content.Q_USER_QQ))));
					}
				}
				return null;
			}
			
		
		});
		return user;
	}

	/**
	 * 当版本数为1的时候，覆盖更新。版本数不为1时，多个版本可取最新版本
	 */
	@Override
	public Boolean update(final User u) {
		return hTemplate.execute(Content.USER_TABLE, new TableCallback<Boolean>(){

			@Override
			public Boolean doInTable(HTableInterface table) throws Throwable {
				Put p = new Put(Bytes.toBytes(u.getUserId()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_NAME), Bytes.toBytes(u.getUserName()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_PASSWORD), Bytes.toBytes(u.getPassword()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_EMAIL), Bytes.toBytes(u.getEmail()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_NUM), Bytes.toBytes(u.getNum()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_QQ), Bytes.toBytes(u.getQq()));
				p.add(Bytes.toBytes(Content.USER_TABLE_INFO), Bytes.toBytes(Content.Q_USER_TEL), Bytes.toBytes(u.getTel()));
				table.put(p);
				return true;
			}
			
		});
	}

	/**
	 * 返回true为存在
	 */
	@Override
	public Boolean check(final String username) {
		return hTemplate.find(Content.USER_TABLE, Content.USER_TABLE_INFO, new ResultsExtractor<Boolean>(){

			@Override
			public Boolean extractData(ResultScanner arg0) throws Exception {
				Boolean flat=false;
				for (Result result : arg0) {
					if(username.equals(Bytes.toString(result.getRow()))){
						flat=true;
					}
				}
				LOG.info(flat+"-------------------------------------------------------------");
				return flat;
			}
			
		});
	}

}
