package spring.test1;

public class Hello {
	String name = "";
	String phone, address;
	
	public Hello() {
	name="디폴트생성자";
	}

	public Hello(String name) {
		this.name = name;
	}
	
	public String getInfo(){
		String s = "name: "+name+"\n" + "address: "+address+"\n"+"phone: "+phone;
		return s;
	}
	
	public void writeName(){
		System.out.println("내 이름은 "+name);
		System.out.println("내 핸폰 번호는" +phone);
		System.out.println("나의 주소는 : "+address);
		System.out.println("---------------------------------");
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
