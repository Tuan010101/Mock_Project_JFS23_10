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

	public static void sendContact(Contact contact) throws AddressException, MessagingException {
		String fullName = contact.getFullName();
		String email = contact.getEmail();
		String subject = contact.getSubject();
		String message = contact.getMessage();

		String bodyEmail = "<h3>Chào bạn <b>" + fullName + "</b></h3>"
				+ "Chúng tôi đã nhận được Email liên hệ từ bạn.Nội dung phản hồi:" 
				+ "<blockquote><i><b>" + subject
				+ "</b><br>" + message + "</i></blockquote>"
				+ "Email sẽ được chúng tôi phản hồi trong thời gian sớm nhất." + "<h3>Trân trọng!</h3>";

		sendHTML(email, subject, bodyEmail);
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
		mailServerProperties.put("mail.smtp.starttls.enable", "true");

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
