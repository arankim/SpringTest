package spring.test1;

public class Hello {
	String name = "";
	String phone, address;
	
	public Hello() {
	name="����Ʈ������";
	}

	public Hello(String name) {
		this.name = name;
	}
	
	public String getInfo(){
		String s = "name: "+name+"\n" + "address: "+address+"\n"+"phone: "+phone;
		return s;
	}
	
	public void writeName(){
		System.out.println("�� �̸��� "+name);
		System.out.println("�� ���� ��ȣ��" +phone);
		System.out.println("���� �ּҴ� : "+address);
		System.out.println("---------------------------------");
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
