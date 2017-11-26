package register.spring;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class SendMail {
	
	private JavaMailSender mailSender;
	private MemberDao memberDao;
	
	private String setfrom = "itbank.1111@gmail.com";
	private String title = "인증번호";
	private String content = "인증번호 : ";

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void Send(RegisterRequest2 req, int ran) throws AlreadyExistingMemberException{
		Member member = (Member) memberDao.selectByEmail(req.getEmail());
		if(member != null) {
			throw new AlreadyExistingMemberException();
		}
		try{
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = 
					new MimeMessageHelper(message, true, "utf-8");
			
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(req.getEmail());     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content + ran);  // 메일 내용
			
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
