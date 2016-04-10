package com.hun.social.repositories;

import java.util.Arrays;
import java.util.List;

import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.BinaryPrefixComparator;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.data.hadoop.hbase.TableCallback;
import org.springframework.stereotype.Repository;

import com.hun.social.models.Follow;
import com.hun.social.util.Content;
import com.hun.social.util.Md5Utils;

@Repository
public class FollowsDaoImpl implements FollowsDao{

	@Autowired
	private HbaseTemplate hTemplate;

	/**
	 * 过滤前缀为user1to/by的所有用户
	 */
	@Override
	public List<String> getUser_to(final String user1, final String fork_Or_Byfork) {
		Scan scan = new Scan();
		scan.addFamily(Bytes.toBytes(Content.FOLLOW_TABLE_INFO));
		Filter filter = new RowFilter(CompareFilter.CompareOp.EQUAL, new BinaryPrefixComparator(Md5Utils.md5Sum(user1+fork_Or_Byfork)));
	    scan.setFilter(filter);
	    
	    return  hTemplate.find(Content.FOLLOW_TABLE, scan, new RowMapper<String>(){

			@Override
			public String mapRow(Result result, int rowNum)
					throws Exception {
				return Bytes.toString(result.getValue(Bytes.toBytes(Content.FOLLOW_TABLE_INFO), Bytes.toBytes(1)));
				
			} 	
		});
		
		
	}

	@Override
	public Boolean add_follow(final Follow follow) {
		return hTemplate.execute(Content.FOLLOW_TABLE, new TableCallback<Boolean>(){

			@Override
			public Boolean doInTable(HTableInterface table) throws Throwable {
				Put p = new Put(mkRowKey(follow));
				p.add(Bytes.toBytes(Content.FOLLOW_TABLE_INFO), Bytes.toBytes(1), Bytes.toBytes(follow.getUser2()));
				return true;
			}
			
		});
	}
	/**
	 * 行键的制作：被关注与主动关注：用户id与标识符放在一起
	 * @param a
	 * @param b
	 * @param flat
	 * @return
	 */
	private static byte[] mkRowKey(Follow f){
		byte[] ahash = Md5Utils.md5Sum(f.getUser1()+f.getFork_by());
		byte[] bhash = Md5Utils.md5Sum(f.getUser2());
		byte[] rowkey = new byte[Md5Utils.MD5_LENGTH*2];
		
		int offset = 0;
		offset = Bytes.putBytes(rowkey, offset, ahash,0,ahash.length);
		Bytes.putBytes(rowkey, offset, bhash, 0, bhash.length);
		return rowkey;
	}
	
	private static byte[][] splitRowkey(byte[] rowkey){
		byte[][] result = new byte[2][];
		
		result[0] = Arrays.copyOfRange(rowkey, 0, Md5Utils.MD5_LENGTH);
		result[1] = Arrays.copyOfRange(rowkey, Md5Utils.MD5_LENGTH, Md5Utils.MD5_LENGTH*2);
		return result;
	}
	
	
	
	
}
