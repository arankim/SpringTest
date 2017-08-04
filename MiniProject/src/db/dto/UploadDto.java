package db.dto;

import java.sql.Timestamp;

public class UploadDto {
	private int num;
	private String id;
	private String subject;
	private String content;
	private String filename;
	private int readcount;
	private Timestamp writeday;

	public UploadDto(int num, String id, String subject, String content, String filename, int readcount,
			Timestamp writeday) {
		super();
		this.num = num;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.filename = filename;
		this.readcount = readcount;
		this.writeday = writeday;
	}
	
	public UploadDto(String id, String subject, String content, String filename) {
		super();
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.filename = filename;
	}
	
	public UploadDto() {

	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	

}
