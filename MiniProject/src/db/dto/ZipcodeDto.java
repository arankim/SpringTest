package db.dto;

public class ZipcodeDto {
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String ri;
	private String bunzi;
	
	public ZipcodeDto() {
	}
	
	public ZipcodeDto(String zipcode, String sido, String gugun, String dong, String ri, String bunzi) {
		this.zipcode = zipcode;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.ri = ri;
		this.bunzi = bunzi;
	}

	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getRi() {
		return ri;
	}
	public void setRi(String ri) {
		this.ri = ri;
	}
	public String getBunzi() {
		return bunzi;
	}
	public void setBunzi(String bunzi) {
		this.bunzi = bunzi;
	}

	@Override
	public String toString() {
		return zipcode +" " + sido +" " + gugun + " " + dong + " " + ri + " " + bunzi ;

	}
	
	
	
	
	
	

}
