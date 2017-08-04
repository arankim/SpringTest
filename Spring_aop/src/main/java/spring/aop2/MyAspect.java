package spring.aop2;

public class MyAspect {
	
	public void before(){
		System.out.println("문을 열고 집에 들어간다");
	}
	
	public void after_returning(){
		System.out.println("옷갈아입고 잔다");
	}

	public void after_throwing(){
		System.out.println("119에 신고한다.");
	}
	
	public void after(){
		System.out.println("문을 열고 집에 나온다");
	}

}
