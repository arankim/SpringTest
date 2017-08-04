package spring.model;

public class SangpumDto {
	private int num;
	private String sang;
	private int su;
	private int dan;
	
	public SangpumDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SangpumDto(int num, String sang, int su, int dan) {
		super();
		this.num = num;
		this.sang = sang;
		this.su = su;
		this.dan = dan;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSang() {
		return sang;
	}
	public void setSang(String sang) {
		this.sang = sang;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getDan() {
		return dan;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	
	

}
