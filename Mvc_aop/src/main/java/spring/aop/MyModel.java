package spring.aop;

import org.springframework.stereotype.Component;

@Component
public class MyModel {
	public String processMsg(){
		System.out.println("핵심 기능 실행됨");
		return "아주 중요한 비즈니스 로직 수행중!";
	}
	
	

}
