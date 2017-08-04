package db.dto;

import java.sql.Timestamp;

public class ReplyDto {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private Timestamp writeday;

	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReplyDto(int num, String writer, String subject, String content, int readcount, int ref, int re_step,
			int re_level, Timestamp writeday) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.writeday = writeday;
	}
	
	public ReplyDto(int ref, int re_step, int re_level) {
		super();
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	

}
