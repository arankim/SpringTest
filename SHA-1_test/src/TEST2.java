
public class TEST2 {
	public static void main(String[] args) {
		int i = 150;
		System.out.println(Integer.toBinaryString(i));
		
		byte b = (byte)i; //����Ʈ�� ����ȯ�ߴٰ�
				System.out.println(Integer.toBinaryString(b)); //�ٽ� int������ ������ �Ǿ� ��. ù���ڰ� 1�̹Ƿ� ������ ��Ʈ���� 1�� ä����
		System.out.println(0xff);
		System.out.println(0x100);

	}
}
