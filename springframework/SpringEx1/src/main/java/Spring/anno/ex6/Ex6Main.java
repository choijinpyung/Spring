package Spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		MysqlController cont=(MysqlController)app.getBean("mysqlc");
		
		cont.myInsert("김영준");
		cont.mydelete("3");
		cont.myselect("홍성경");
	}

}
