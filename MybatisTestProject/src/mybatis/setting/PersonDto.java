package mybatis.setting;

import java.sql.Timestamp;

public class PersonDto {
	private int num;
	private String name;
	private String hp;
	private Timestamp writeday;
	
	public PersonDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PersonDto(String name, String hp) {
		super();
		this.name = name;
		this.hp = hp;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	
	

}
