package spring.test2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudentMain {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("/spring/test2/appContext.xml");
		StudentInto info = ac.getBean("studentinfo", StudentInto.class);

		for (int i = 0; i < info.stu.getList().size(); i++) {
			System.out.println("����Ʈ��: " + info.stu.getList().get(i));
			System.out.println("����: " + info.stu.getKor());
			System.out.println("����: " + info.stu.getEng());
			System.out.println("����: " + info.stu.getMat());
			System.out.printf("�հ� %.2f \n", info.getAvg());
			System.out.println("����: " + info.getTotal());
			System.out.println("------------------------------------------------");
		}
	}

}
