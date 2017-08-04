package spring.aop2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AopMain2 {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext.xml");
		PersonImpl boy = context.getBean("boy",Boy.class);
		boy.doSomething();
		System.out.println("========================");
		PersonImpl girl = context.getBean("girl",Girl.class);
		girl.doSomething();
		
	}

}
