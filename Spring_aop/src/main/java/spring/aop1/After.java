package spring.aop1;

public class After implements PersonImpl {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("문을 열고 집을 나온다");
	}

}
