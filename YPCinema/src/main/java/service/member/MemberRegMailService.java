package service.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import model.DTO.MemberDTO;

@Service
public class MemberRegMailService {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMemberJoinMail(MemberDTO dto) {
		MimeMessage msg = mailSender.createMimeMessage();	// 메세지를 차곡차곡 쌓아서 보내는 거라고...
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMddHHmmss");
		String num = dateForm.format(new Date());
		String content = "<html><body>안녕하세요. 신규회원 \"" + dto.getM_id() + "\"님 YPCimena 가입을 환영합니다.<br />아래 링크를 눌러야 가입이 완료됩니다.<br />"
				+ "<a href='http://localhost:8080/YPCinema/memberMail?num=" + num + "&receiver=" + dto.getM_email() + "&userId=" + dto.getM_id() + "'>"
				+ "<strong><b>가입을 완료하시려면 여기를 눌러주세요.</b></strong></body></html>";
		String subject = "신규회원 \"" + dto.getM_id() + "\"님 YPCimena 가입을 환영합니다.";
		try {
			msg.setHeader("content-type", "text/html; charset=UTF-8");
			msg.setContent(content, "text/html; charset=UTF-8");
			msg.setSubject(subject);
			msg.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(dto.getM_email()));
			mailSender.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
