

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 现在的一些IP暂时写死
 * @author huanghuiyuan
 *
 */
public class HbaseUtil {
	
	private static final  Logger LOGGER = LoggerFactory.getLogger(HbaseUtil.class);
	private static String quorum="hbase.zookeeper.quorum";
	private static String IP="127.0.0.1";
	
	private static Connection connection;
	public static Connection getConnection(){
		try{
			Configuration conf = HBaseConfiguration.create();
			conf.set(quorum, IP);
			conf.set("hbase.zookeeper.property.clientPort", "2181");
			//conf.set("hbase.master", "127.0.0.1:60000");
			connection = ConnectionFactory.createConnection(conf);
			return connection;
		}catch(Exception e){
			e.printStackTrace();
			LOGGER.debug(e.getMessage());
			return null;
		}
	}
	public static void CloseHbase(){
		try{
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	


}
