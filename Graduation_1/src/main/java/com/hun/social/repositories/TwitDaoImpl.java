package com.hun.social.repositories;

import java.util.Arrays;
import java.util.List;

import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.BinaryPrefixComparator;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.ResultsExtractor;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.data.hadoop.hbase.TableCallback;
import org.springframework.stereotype.Repository;

import com.hun.social.models.Follow;
import com.hun.social.models.Twit;
import com.hun.social.models.User;
import com.hun.social.util.Content;
import com.hun.social.util.Md5Utils;

@Repository
public class TwitDaoImpl implements TwitDao {

	@Autowired
	private HbaseTemplate hTemplate;

	/**
	 * 内容+时间戳都要返回
	 */
	@Override
	public List<Twit> get_List_Twit(String userID) {
		Scan scan = new Scan();
		scan.addFamily(Bytes.toBytes(Content.FOLLOW_TABLE_INFO));
		Filter filter = new PrefixFilter(Bytes.toBytes(userID)); // OK  筛选匹配行键的前缀成功的行
		//Filter filter = new RowFilter(CompareFilter.CompareOp.EQUAL, new BinaryPrefixComparator(Md5Utils.md5Sum(user1+fork_Or_Byfork)));
	    scan.setFilter(filter);
	    
	    return  hTemplate.find(Content.FOLLOW_TABLE, scan, new RowMapper<Twit>() {
			@Override
			public Twit mapRow(Result result, int rowNum) throws Exception {
				Twit twit = new Twit();
				twit.setUsername(Bytes.toString(result.getRow()));
			    twit.setContent(Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO), Bytes.toBytes(Content.Q_TWIT_CONTEXT))));;
			    twit.setDt(Bytes.toLong(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO), Bytes.toBytes(Content.Q_TWIT_TIME))));
			    return twit;
			}
		});
	}

	/**
	 * 主键是由用户ID与倒序时间戳
	 */
	@Override
	public Boolean add(final Twit twit) {
		return hTemplate.execute(Content.TWIT_TABLE,
				new TableCallback<Boolean>() {

					@Override
					public Boolean doInTable(HTableInterface table)
							throws Throwable {
						Put p = new Put(mkRowkey(twit.getUsername(),twit.getDt()));
						p.add(Bytes.toBytes(Content.TWIT_TABLE_INFO),Bytes.toBytes(Content.Q_TWIT_TIME),Bytes.toBytes(twit.getDt().getMillis()));
						p.add(Bytes.toBytes(Content.TWIT_TABLE_INFO),Bytes.toBytes(Content.Q_TWIT_CONTEXT),Bytes.toBytes(Content.Q_TWIT_CONTEXT));
						return true;
					}

				});
	}

	/**
	 * 时间所生成的字节码都是8位
	 * 
	 * @param username
	 * @param dt
	 * @return
	 */
	private static byte[] mkRowkey(String username, DateTime dt) {
		byte[] userHash = Md5Utils.md5Sum(username);
		byte[] timestamp = Bytes.toBytes(Long.MAX_VALUE - dt.getMillis());
		byte[] rowKey = new byte[Md5Utils.MD5_LENGTH + 8];

		int offset = 0;
		offset = Bytes.putBytes(rowKey, offset, userHash, 0, userHash.length);
		Bytes.putBytes(rowKey, offset, timestamp, 0, timestamp.length);
		return rowKey;

	}
	private static byte[][] splitRowkey(byte[] rowkey){
		byte[][] result = new byte[2][];
		
		result[0] = Arrays.copyOfRange(rowkey, 0, Md5Utils.MD5_LENGTH);
		result[1] = Arrays.copyOfRange(rowkey, Md5Utils.MD5_LENGTH, Md5Utils.MD5_LENGTH*2);
		return result;
	}

}
