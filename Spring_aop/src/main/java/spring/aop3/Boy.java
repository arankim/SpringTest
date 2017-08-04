package spring.aop3;

import org.springframework.stereotype.Component;

@Component
public class Boy implements PersonImpl {

	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		System.out.println("게임을 한다");
	}

}
