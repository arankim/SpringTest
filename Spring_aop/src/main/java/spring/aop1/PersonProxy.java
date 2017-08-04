package spring.aop1;

public class PersonProxy implements PersonImpl {
	private PersonImpl person;
	private PersonImpl before;
	private PersonImpl afterReturning;
	private PersonImpl afterThrowing;
	private PersonImpl after;	
	
	public void setPerson(PersonImpl person) {
		this.person = person;
	}


	public void setBefore(PersonImpl before) {
		this.before = before;
	}


	public void setAfterReturning(PersonImpl afterReturning) {
		this.afterReturning = afterReturning;
	}


	public void setAfterThrowing(PersonImpl afterThrowing) {
		this.afterThrowing = afterThrowing;
	}


	public void setAfter(PersonImpl after) {
		this.after = after;
	}


	@Override
	public void doSomething() {
		// TODO Auto-generated method stub
		//여자
		/*
		 * 1. 문을 열고 집에 들어간다
		 * 2. 화장을 지운다
		 * 3. 옷갈아입고 잔다
		 * 4. 문을 열고 집을나온다
		 */
		//각 예외상황: 문제가 생기면 119 에 신고한다
		//남자
		/*
		 * 1. 문을 열고 집에 들어간다
		 * 2. 게임을 한다
		 * 3. 옷갈아입고 잔다
		 * 4. 문을 열고 집으 ㄹ나온다
		 */
		
		before.doSomething();
		try{
			person.doSomething();
			afterReturning.doSomething();
		}catch(Exception e)
		{
			afterThrowing.doSomething();
		}
		after.doSomething();
	}

}
