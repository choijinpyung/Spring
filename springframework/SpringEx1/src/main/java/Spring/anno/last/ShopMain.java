package Spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext anno1=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		JumunController jumun=(JumunController)anno1.getBean("jumunController");
		
		jumun.insertJumun("요가매트", 35000, "핑크");
		jumun.deleteJumun("3");
		jumun.selectJumun("아령", 30000, "검정");
		
	}

}
