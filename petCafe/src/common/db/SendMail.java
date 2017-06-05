package common.db;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class SendMail {
	
	String host = "smtp.gmail.com";
	String subject = "PetCafe 인증번호 전달";
	String fromName = "petCafe관리자";
	String form = "sung.hongmo3@gmail.com";
	String id = "";
	String pass = "";
	
	public void sendEmail(String email, String authNum) {
		
		String to1 = email;
		String content = "인증번호 [" + authNum + "]";
		
		try {
			
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls", "ture");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", form);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
					new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication( id, pass);
							}
					});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(form, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //보내는사람 설정
			
			InternetAddress[] address1 = { new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(content, "text/html;charset=utf-8");
			
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sendMail에서 에러");
		}
	}
	
	public void sendEmailForID(String email, String userId) {
		
		String to1 = email;
		
		String content = "회원님의 아이디 [" + userId + "]";
		
		try {
			
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls", "ture");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", form);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
					new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication( id, pass);
							}
					});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(form, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //보내는사람 설정
			
			InternetAddress[] address1 = { new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(content, "text/html;charset=utf-8");
			
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sendMail에서 에러");
		}
	}

	public void requestTempPass(String email, String memberId, String tempPass) {
	
		String to1 = email;
		String content = "임시비밀번호 [" + tempPass + "]";
		
		try {
			
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls", "ture");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", form);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
					new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication( id, pass);
							}
					});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(form, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //보내는사람 설정
			
			InternetAddress[] address1 = { new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(content, "text/html;charset=utf-8");
			
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sendMail에서 에러");
		}
	}
}
