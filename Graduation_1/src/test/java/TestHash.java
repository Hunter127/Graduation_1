import org.junit.Test;


public class TestHash {
	
	
	@Test
	public void Test(){
		HbaseDaoImpl hImpl = new HbaseDaoImpl();
		hImpl.create_table("users1", "info");
	}
	

}
