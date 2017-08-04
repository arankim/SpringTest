package spring.aop3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AopMain3 {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appContextAnno.xml");
		PersonImpl boyy = context.getBean("boyy",Boy.class);
		boyy.doSomething();
		System.out.println("============Anno=========");
		PersonImpl girll = context.getBean("girll",Girl.class);
		girll.doSomething();
		
	}

}
