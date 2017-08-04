package spring.aop1;

public class AfterThrowing implements PersonImpl {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("문제가 생겨서 119에 신고한다");
	}

}
