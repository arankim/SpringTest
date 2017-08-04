package db.dto;

import java.sql.Timestamp;

public class MemberDto {
	private String num;
	private String name;
	private String id;
	private String pass;
	private String address;
	private String email1;
	private String email2;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String hp;
	private Timestamp gaipday;
	private String year;
	private String month;
	private String day;
	private String birth;
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberDto(String name, String id, String pass, String address,  String email, String hp, String birth) {
		super();
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.address = address;
		this.email = email;
		this.hp = hp;
		this.birth = birth;
	}
	

	public MemberDto(String num, String name, String id, String pass, String address, String email, String hp,
			Timestamp gaipday, String birth) {
		super();
		this.num = num;
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.address = address;
		this.email = email;
		this.hp = hp;
		this.gaipday = gaipday;
		this.birth = birth;
	}

	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public Timestamp getGaipday() {
		return gaipday;
	}
	public void setGaipday(Timestamp gaipday) {
		this.gaipday = gaipday;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}
	

}
