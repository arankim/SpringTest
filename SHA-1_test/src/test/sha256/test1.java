package test.sha256;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class test1 {
	public String endcoding(String param) {
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(param.getBytes());
			byte bs[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < bs.length; i++) {

				sb.append(Integer.toString((bs[i] & 0xff) + 0x100, 16).substring(1)); // byte를
																							// 16진수로
																							// 변환해주는
																							// 코드
			}
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			System.err.println(e.getMessage());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return result;
	}


}
