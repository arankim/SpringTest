package spring.dto;

import java.sql.Timestamp;

public class BbsAnswerDto {
	private int pk;
	private int num;
	private String nickname;
	private String content;
	private Timestamp writeday;
	
	public BbsAnswerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BbsAnswerDto(int num, String nickname, String content) {
		super();
		this.num = num;
		this.nickname = nickname;
		this.content = content;
	}

	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	
	
}