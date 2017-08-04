package db.dto;

import java.sql.Timestamp;

public class GuestDto {
	private int num;
	private String name;
	private String id;
	private String pass;
	private String content;
	private int avata;
	private Timestamp writeday;
	
	public GuestDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GuestDto(int num, String name, String id, String pass, String content, Timestamp writeday,int avata) {
		super();
		this.num = num;
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.content = content;
		this.writeday = writeday;
		this.avata = avata;
	}
	
	public GuestDto(int num, String content, int avata){
		this.num = num;
		this.content = content;
		this.avata = avata;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getAvata() {
		return avata;
	}

	public void setAvata(int avata) {
		this.avata = avata;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}

	
	
	
}
