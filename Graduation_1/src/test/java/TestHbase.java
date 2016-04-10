import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;

public class TestHbase {
	
	public static void main(String[] args) {

	       ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "spring-hbase.xml" });
	       BeanFactory factory = (BeanFactory) context;
	       HbaseTemplate htemplate = (HbaseTemplate) factory.getBean("hbaseTemplate");
	      // htemplate
	       htemplate.get("users", "123", new RowMapper<String>(){
	           @Override
	           public String mapRow(Result result, int rowNum) throws Exception {
	                for(KeyValue kv :result.raw()){
	                    String key = new String(kv.getQualifier());
	                    String value = new String(kv.getValue());
	                    System.out.println(key +"= "+Bytes.toString(value.getBytes()));
	                }

	                return null;

	           }

	       });

	}
}
