package spring.aop3;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class MyAspect {
	
	@Before("pt()")
	public void before(){
		System.out.println("문을 열고 집에 들어간다");
	}
	
	@AfterReturning("pt()")
	public void after_returning(){
		System.out.println("옷갈아입고 잔다");
	}

	@AfterThrowing("pt()")
	public void after_throwing(){
		System.out.println("119에 신고한다.");
	}
	
	@After("pt()")
	public void after(){
		System.out.println("문을 열고 집에 나온다");
	}

}
