import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;


public class Test {
  public static void main(String[] args) {
	try {
		Context ct=new InitialContext();
		String str=(String)ct.lookup("java:comp/env/tjndi");
	} catch (NamingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
