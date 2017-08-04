package spring.test1;

public class Person {
	private Hello hello;
	private String blood;
	public Person(Hello hello) {
		this.hello = hello;
	}
	
	public void setBlood(String blood) {
		this.blood = blood;
	}
	
	public void writePerson(){
		System.out.println(hello.getInfo());
		System.out.println("³» Ç÷¾×ÇüÀº: "+blood);
	}
	
	

}
