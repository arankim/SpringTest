package spring.aop1;

public class AfterReturning implements PersonImpl {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("옷갈아입고 잔다");
	}

}
