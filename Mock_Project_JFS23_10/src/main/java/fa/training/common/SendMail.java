package fa.training.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import fa.training.entities.Contact;

public class SendMail {

	public static void sendCodeActiveEmail(String email, String code) throws AddressException, MessagingException {
		
		String bodyEmail = "<h3>Chào bạn</h3>"
				+ "Bạn vừa gửi yêu cầu lấy lại mật khẩu:" 
				+ "<blockquote>"
						+ "<b> Code: " + code + "</b>"
				+ "</blockquote>"
				+ "<h3>Trân trọng!</h3>";
 
		sendHTML(email, "Password reset code from WEB VEGEFOODS", bodyEmail);
	}
	
	public static void sendLinkActiveEmail(String email, String codeLink) throws AddressException, MessagingException {
		
		String bodyEmail = "<h3>Chào bạn</h3>"
				+ "Xác nhận Email:" 
				+ "<blockquote>"
				+ "<b> Link active: </b>" + "<a href='" + codeLink + "'>Click here to activate account</a>" + "<br>"
				+ "</blockquote>"
				+ "<h3>Trân trọng!</h3>";
		
		sendHTML(email, "Active Email from WEB VEGEFOODS", bodyEmail);
	}
	
	public static void sendAccount(String email, String username, String password) throws AddressException, MessagingException {
		
		String bodyEmail = "<h3>Chào bạn</h3>"
				+ "Vui lòng không cung cấp tài khoản mật khẩu trong bất cứ trường hợp nào:" 
				+ "<blockquote>"
				+ "<b> Tài khoản: "+username+" </b> <br>"
				+ "<b> Mật khẩu: "+password+" </b>"
				+ "</blockquote>"
				+ "<h3>Trân trọng!</h3>";
		
		sendHTML(email, "Active Email from WEB VEGEFOODS", bodyEmail);
	}

	public static void sendContact(Contact contact) throws AddressException, MessagingException {
		String fullName = contact.getFullName();
		String email = contact.getEmail();
		String subject = contact.getSubject();
		String message = contact.getMessage();

		String bodyEmail = "<h3>Chào bạn <b>" + fullName + "</b></h3>"
				+ "Chúng tôi đã nhận được Email liên hệ từ bạn.Nội dung phản hồi:" 
				+ "<blockquote><i>"
						+ "<b>" + subject + "</b><br>" 
						+ message 
				+ "</i></blockquote>"
				+ "Email sẽ được chúng tôi phản hồi trong thời gian sớm nhất." 
				+ "<h3>Trân trọng!</h3>";

		sendHTML(email, "Contact from WEB VEGEFOODS", bodyEmail);
	}

	public static void sendHTML(String recipientAddress, String subject, String message)
			throws AddressException, MessagingException {
		Properties mailServerProperties;
		Session getMailSession;
		MimeMessage mailMessage;

		// Step1: setup Mail Server
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.host", "smtp.gmail.com");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
		mailServerProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// Step2: get Mail Session
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		mailMessage = new MimeMessage(getMailSession);

		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientAddress));
		mailMessage.setSubject(subject);
		mailMessage.setContent(message, "text/html; charset=UTF-8");

		// Step3: Send mail
		Transport transport = getMailSession.getTransport("smtp");

		transport.connect("smtp.gmail.com", "phunghoangphuloc@gmail.com", "hoct fwiy enog zxgq");
		transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
		transport.close();
	}
}
