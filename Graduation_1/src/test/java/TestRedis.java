
import redis.clients.jedis.Jedis;

/**
 * Hello world!
 *
 */
public class TestRedis 
{
    public static void main( String[] args )
    {
        Jedis jedis = new Jedis("127.0.0.1", 6379);
        jedis.set("age", "21");
        String value = jedis.get("age");
        System.out.println(value);
    }
}
