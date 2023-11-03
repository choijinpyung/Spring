package Spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext2.xml");
		
		//MyInfo 생성 후 확인
		MyInfo my=(MyInfo)context.getBean("my");
		
		System.out.println(my.toString());
		System.out.println(my);
		
		//Person
		Person p=(Person)context.getBean("person");
		p.writeData();
	}
}
