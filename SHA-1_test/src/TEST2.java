
public class TEST2 {
	public static void main(String[] args) {
		int i = 150;
		System.out.println(Integer.toBinaryString(i));
		
		byte b = (byte)i; //바이트로 형변환했다가
				System.out.println(Integer.toBinaryString(b)); //다시 int형으로 형변한 되아 됨. 첫숫자가 1이므로 나머지 비트들은 1로 채워짐
		System.out.println(0xff);
		System.out.println(0x100);

	}
}
