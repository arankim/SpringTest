package spring.upload;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class UploadDto {
	private String msg;
	private ArrayList<MultipartFile> upfile;
	
	public UploadDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UploadDto(String msg, ArrayList<MultipartFile> upfile) {
		super();
		this.msg = msg;
		this.upfile = upfile;
	}

	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public ArrayList<MultipartFile> getUpfile() {
		return upfile;
	}
	public void setUpfile(ArrayList<MultipartFile> upfile) {
		this.upfile = upfile;
	}
	
	

}
