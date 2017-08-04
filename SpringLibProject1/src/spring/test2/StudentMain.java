package spring.test2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudentMain {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("/spring/test2/appContext.xml");
		StudentInto info = ac.getBean("studentinfo", StudentInto.class);

		for (int i = 0; i < info.stu.getList().size(); i++) {
			System.out.println("리스트명: " + info.stu.getList().get(i));
			System.out.println("국어: " + info.stu.getKor());
			System.out.println("영어: " + info.stu.getEng());
			System.out.println("수학: " + info.stu.getMat());
			System.out.printf("합계 %.2f \n", info.getAvg());
			System.out.println("총합: " + info.getTotal());
			System.out.println("------------------------------------------------");
		}
	}

}
