package homework;

import java.sql.Timestamp;

public class HomeworkDto {
	private int num;
	private String content;
	private Timestamp writeday;
	private int chu;
	
	public HomeworkDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HomeworkDto(String content, Timestamp writeday) {
		super();
		this.content = content;
		this.writeday = writeday;
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public int getChu() {
		return chu;
	}

	public void setChu(int chu) {
		this.chu = chu;
	}
	

}
