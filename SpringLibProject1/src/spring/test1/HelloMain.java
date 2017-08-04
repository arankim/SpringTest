package spring.test1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {
	public static void main(String[] args) {
/*		Hello hello = new Hello();
		Hello hello2 = new Hello("ȫ�浿");
		hello.writeName();
		hello2.writeName();*/
		ApplicationContext ac = new ClassPathXmlApplicationContext("/spring/test1/appContext.xml");
		Hello h1 = (Hello)ac.getBean("hello1");
		h1.writeName();
		
		Hello h2 = ac.getBean("hello2", Hello.class);
		h2.writeName();
		
		Person p1 = ac.getBean("person",Person.class);
		p1.writePerson();
		
		
	}

}
