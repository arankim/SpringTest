package spring.test;

public class TestDto {
	private String name;
	private String age;
	private String addr;
	
	public TestDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TestDto(String name, String age, String addr) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	

}
