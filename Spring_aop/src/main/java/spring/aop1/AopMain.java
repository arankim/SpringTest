package spring.aop1;

public class AopMain {

	public static void main(String[] args) {
		PersonImpl afterTh = new AfterThrowing();
		
		PersonProxy pp = new PersonProxy();
		pp.setAfterThrowing(afterTh);
		
		pp.doSomething();
	}

}
