package db.email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class sendEmail {

	RandomMethod rm = new RandomMethod();

	public boolean send(String email, int authNum) {
		String host = "smtp.gmail.com"; // smtp����
		String subject = "[�׽�Ʈ] ��������";
		String fromName = "�����»��";
		String from = "arane5880"; // ������ ����
		String password = "arxt1231"; // �����»�� ���� ��ȣ
		String toemail = email;
		boolean result = false;
		String content = "������ȣ[" + authNum + "]";
		System.out.println(email);
		try {
			Properties props = new Properties();

			// gmail smtp���� �ʿ��� ȯ�漳��
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host); // SMTP Host
			props.put("mail.smtp.socketFactor.port", "465"); // SSL Port
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // SSL
			// props.put("mail.smtp.user", fromName); //������ ���
			props.put("mail.smtp.auth", "true"); // Enabling SMTP Authentication
			props.put("mail.smtp.port", "25"); // SMTP Port �⺻��Ʈ 25
			props.setProperty("mail.smtp.quitwait", "false");

			// ���������
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, password);
				}
			};

			Session session = Session.getDefaultInstance(props, auth);
			MimeMessage message = new MimeMessage(session);

			// ������ �����ּ�, ������ ��� �̸� ����
			message.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] iadd = { new InternetAddress(toemail) };

			// ��������
			message.setSubject(subject);

			// ������ ��¥
			message.setSentDate(new java.util.Date());
			// �����ڼ���
			message.setRecipients(Message.RecipientType.TO, iadd);
			Multipart mp = new MimeMultipart();
			MimeBodyPart mbp1 = new MimeBodyPart();

			// ���� ���� ����
			mbp1.setText(content);
			mp.addBodyPart(mbp1);
			message.setContent(mp, "text/html;charset=euc-kr");
			Transport.send(message);
			System.out.println("���Ϲ߼� ����");
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
