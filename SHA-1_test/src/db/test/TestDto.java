package db.test;

public class TestDto {
	private String id;
	private String pass;
	private String SHAPass;
	
	public TestDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TestDto(String id, String pass, String SHAPass) {
		super();
		this.id = id;
		this.pass = pass;
		this.SHAPass = SHAPass;
	}
	
	public TestDto(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
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
	public String getSHAPass() {
		return SHAPass;
	}
	public void setSHAPass(String SHAPass) {
		this.SHAPass = SHAPass;
	}
	
	

}
