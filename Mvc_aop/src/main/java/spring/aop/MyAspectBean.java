package spring.aop;

public class MyAspectBean {
	public void beforeProcess(){
		SecurityClass sc = new SecurityClass();
		sc.security();
	}
	
	public void afterProcess(){
		System.out.println("핵심 내용 후에 설명함");
	}

}
