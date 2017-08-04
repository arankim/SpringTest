package spring.aop1;

public class Before implements PersonImpl {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("문을 열고 집에 들어간다");
	}

}
