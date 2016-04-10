package com.hun.social.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * MD5为16位，，加不加MD5需要权衡。MD5是为了散列：hbase两种取数据的方式，get，scan
 * @author huanghuiyuan
 *
 */
public class Md5Utils {
	
	public static final int MD5_LENGTH = 16;
	
	public static byte[] md5Sum(String s){
		MessageDigest d;
		try{
			d = MessageDigest.getInstance("MD5");
		}catch(NoSuchAlgorithmException e){
			throw new RuntimeException("MD5 algorithm not available!",e);
		}
		return d.digest(Bytes.toBytes(s));
	}
	
	

}
