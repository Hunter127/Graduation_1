import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hun.social.models.User;
import com.hun.social.repositories.UserDao;
import com.hun.social.repositories.UserDaoImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mvc.xml"})
public class TestHbase_Spring {
	
	@Resource(name="userDao")
	private UserDao userDao;

	
	@Test
	public void test() {
		User u = new User("admin", "userName", "admin", "email", "num", "tel", "qq");
		userDao.add(u);
	}

}
