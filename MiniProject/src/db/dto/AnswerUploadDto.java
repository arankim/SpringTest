package db.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class AnswerUploadDto {
	private int num;
	private int pk;
	private String name;
	private String id;
	private String content;
	private Timestamp sdate;
	private int readcount;
	
	public AnswerUploadDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AnswerUploadDto(int num, int pk, String name, String id, String content, Timestamp sdate, int readcount) {
		this.num = num;
		this.pk = pk;
		this.name = name;
		this.id = id;
		this.content = content;
		this.sdate = sdate;
		this.readcount = readcount;
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
	public Timestamp getSdate() {
		return sdate;
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	

}
