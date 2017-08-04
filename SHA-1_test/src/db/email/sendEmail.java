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
		String host = "smtp.gmail.com"; // smtp서버
		String subject = "[테스트] 인증메일";
		String fromName = "보내는사람";
		String from = "arane5880"; // 보내는 메일
		String password = "arxt1231"; // 보내는사람 메일 암호
		String toemail = email;
		boolean result = false;
		String content = "인증번호[" + authNum + "]";
		System.out.println(email);
		try {
			Properties props = new Properties();

			// gmail smtp사용시 필요한 환경설정
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host); // SMTP Host
			props.put("mail.smtp.socketFactor.port", "465"); // SSL Port
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // SSL
			// props.put("mail.smtp.user", fromName); //보내는 사람
			props.put("mail.smtp.auth", "true"); // Enabling SMTP Authentication
			props.put("mail.smtp.port", "25"); // SMTP Port 기본포트 25
			props.setProperty("mail.smtp.quitwait", "false");

			// 사용자인증
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, password);
				}
			};

			Session session = Session.getDefaultInstance(props, auth);
			MimeMessage message = new MimeMessage(session);

			// 보내는 메일주소, 보내는 사람 이름 설정
			message.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] iadd = { new InternetAddress(toemail) };

			// 메일제목
			message.setSubject(subject);

			// 보내는 날짜
			message.setSentDate(new java.util.Date());
			// 수신자설정
			message.setRecipients(Message.RecipientType.TO, iadd);
			Multipart mp = new MimeMultipart();
			MimeBodyPart mbp1 = new MimeBodyPart();

			// 메일 본문 설정
			mbp1.setText(content);
			mp.addBodyPart(mbp1);
			message.setContent(mp, "text/html;charset=euc-kr");
			Transport.send(message);
			System.out.println("메일발송 성공");
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
