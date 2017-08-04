package spring.aop3;

import org.springframework.stereotype.Component;

@Component
public class Girl implements PersonImpl {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("화장을 지운다");
	}

}
