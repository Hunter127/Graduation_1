import org.apache.hadoop.hbase.util.Bytes;
import org.joda.time.DateTime;
import org.junit.Test;

import com.hun.social.util.Md5Utils;


public class TestRowKey {
	@Test
	public void Test(){
		  byte[] ahash = Bytes.toBytes("huanghuiyuan");
		    byte[] bhash = Bytes.toBytes("longwei");
		    byte[] rowkey = new byte[32];

		    int offset = 0;
		    offset = Bytes.putBytes(rowkey, offset, ahash, 0, ahash.length);
		   int a = Bytes.putBytes(rowkey, offset, bhash, 3, bhash.length-3);
		   System.out.println(a);
		    System.out.println(Bytes.toString(rowkey));
	}

	@Test
	public void Test1(){
	      DateTime dt = new DateTime();
	      System.out.println(dt);
	      System.out.println(Bytes.toBytes(Long.MAX_VALUE-dt.getMillis()).length);
	     // System.out.println(Long.MAX_VALUE-dt.getMillis());
	     // System.out.println(-1*dt.getMillis());
	}
	@Test
	public void tets(){
		System.out.println(Bytes.toBytes("asasasasasa").length);
		System.out.println(Bytes.toBytes("asasasasaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasa").length);
	}
	@Test
	public void Test2(){
		    DateTime dt = new DateTime();
		    byte[] userHash = Bytes.toBytes("user");
		    byte[] timestamp = Bytes.toBytes(-1 * dt.getMillis());
		    byte[] rowKey = new byte[Md5Utils.MD5_LENGTH + 8];

		    int offset = 0;
		    offset = Bytes.putBytes(rowKey, offset, userHash, 0, userHash.length);
		    Bytes.putBytes(rowKey, offset, timestamp, 0, timestamp.length);
		    System.out.println(rowKey);
	}
}

