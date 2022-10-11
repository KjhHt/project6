
package pms.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import pms.dao.MemberDao;
import pms.vo.Mail;
import pms.vo.Member;

@Service
public class MailSenderService {
	// 컨테이너에 있는 메일 발송 객체 autowiring 처리
	@Autowired(required = false)
	private JavaMailSender sender;

	@Autowired(required = false)
	private MemberDao dao;

	public String sendMail(Mail mail, Member member) {
		String msg = "사원번호 발급 완료"; // 메일 발송이 성공되었을 때,
		// 처리할 메소드 선언
		// 1. 멀티미디어형 메일 데이터 전송
		MimeMessage mmsg = sender.createMimeMessage();
		// 2. 제목 설정
		try {
			mmsg.setSubject("[EPM 사원번호와 임시비밀번호입니다.]");
			// 3. 수신자 설정
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(member.getEmail()));
			// 4. 내용 설정
			mmsg.setText("사원번호/임시비밀번호 발급\n" + member.getName() + "님" + "\n사원등록이 완료되었습니다." + "\n사원번호 : "
					+ member.getEmpno() + "\n임시비밀번호 : " + member.getPassword() + "\n로그인 후 비밀번호 변경을 해주세요."
					+ "\nhttp://216.66.67.160:7080/project06/login.do");
			// 5. 발송 처리
			sender.send(mmsg);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "메일 발송 에러:" + e.getMessage();
			System.out.println(msg);
		} catch (Exception e) {
			msg = "일반 에러 발생:" + e.getMessage();
		}

		return msg;
	}

	public void uptEmpnoAndPassword(Member upt) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String tempPassword = "";

		int idx = 0;
		for (int i = 0; i < 5; i++) {
			idx = (int) (charSet.length * Math.random());
			tempPassword += charSet[idx];
		}
		int empno = ((int) (Math.random() * 999) + 7000);
		upt.setPassword(tempPassword);
		upt.setEmpno(empno);
		dao.uptEmpnoAndPassword(upt);
	}

	public String sendTempPassword(Mail mail, Member member) {
		String msg = "임시비밀번호가 이메일로 발송되었습니다."; // 메일 발송이 성공되었을 때,
		// 처리할 메소드 선언
		// 1. 멀티미디어형 메일 데이터 전송
		MimeMessage mmsg = sender.createMimeMessage();
		member.setName(dao.getMemberName(member));
		// 2. 제목 설정
		try {
			mmsg.setSubject("[EPM 임시비밀번호입니다.]");
			// 3. 수신자 설정
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(member.getEmail()));
			// 4. 내용 설정
			mmsg.setText("임시비밀번호 발급\n" + member.getName() + "님" + " 임시비밀번호입니다." + "\n임시비밀번호 : " + member.getPassword()
					+ "\n로그인 후 비밀번호 변경을 해주세요." + "\nhttp://localhost:7080/project06/login.do");
			// 5. 발송 처리
			sender.send(mmsg);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "메일 발송 에러:" + e.getMessage();
			System.out.println(msg);
		} catch (Exception e) {
			msg = "일반 에러 발생:" + e.getMessage();
		}

		return msg;
	}

	public void recoverPassword(Member upt) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String tempPassword = "";

		int idx = 0;
		for (int i = 0; i < 5; i++) {
			idx = (int) (charSet.length * Math.random());
			tempPassword += charSet[idx];
		}
		upt.setPassword(tempPassword);
		dao.recoverPassword(upt);
	}
}
