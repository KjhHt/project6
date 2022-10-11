package pms.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import pms.service.MailSenderService;
import pms.service.MemberService;
import pms.vo.Mail;
import pms.vo.Member;

@Controller
public class MailController {
	@Autowired(required=false)
	private LocaleResolver localResolver;
	
	@Autowired(required = false)
	private MailSenderService service;
	
	@Autowired(required = false)
	private MemberService mService;

	// http://localhost:7080/springweb/mailForm.do
	@GetMapping("createEmpnoAndPassword.do")
	public String mailForm() {
		return "WEB-INF\\views\\member\\memberdetail.jsp";
	}

	@PostMapping("sendEmpnoAndPassword.do")
	public String mailSender(@RequestParam(value = "mid") int mid, Mail mail, Member member, Model d) {
		if(member != null) {
			service.uptEmpnoAndPassword(member);
			d.addAttribute("msg", service.sendMail(mail, member));
			d.addAttribute("proc", "uptE");
			System.out.println("이름 : " + member.getName());
			
		}
		
		return "WEB-INF\\views\\member\\memberdetail.jsp";
	}
	// http://localhost:7080/project06/recoverpassword.do
	@GetMapping("recoverpassword.do")
	public String recoverPasswordForm(
			@RequestParam(value="lang", defaultValue = "") String lang, HttpServletRequest request, HttpServletResponse response) {
		Locale locale = new Locale(lang);
		localResolver.setLocale(request, response, locale);
		return "WEB-INF\\views\\login\\forgot-password.jsp";
	}

	@PostMapping("sendTempPassword.do")
	public String recoverPassword(Mail mail, Member member, Model d,
			@RequestParam(value="lang", defaultValue = "") String lang, HttpServletRequest request, HttpServletResponse response) {
		Locale locale = new Locale(lang);
		localResolver.setLocale(request, response, locale);
		if(member != null) {
			mService.getMemberName(member);
			service.recoverPassword(member);
			d.addAttribute("msg", service.sendTempPassword(mail, member));
		}
		
		return "WEB-INF\\views\\login\\forgot-password.jsp";
	}

}