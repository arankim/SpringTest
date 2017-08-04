package db.dto;

import java.sql.Date;

public class AnswerDto {
	private int num;
	private int pk;
	private String name;
	private String id;
	private String content;
	private Date sdate;
	
	public AnswerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AnswerDto(int num, int pk, String name, String id, String content, Date sdate) {
		super();
		this.num = num;
		this.pk = pk;
		this.name = name;
		this.id = id;
		this.content = content;
		this.sdate = sdate;
	}


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	

}
