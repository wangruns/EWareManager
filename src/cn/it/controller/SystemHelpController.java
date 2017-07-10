package cn.it.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SystemHelpController {

	/*
	 * 帮助
	 */
	// 系统版本
	@RequestMapping(value = "systemVersion.do")
	public ModelAndView systemVersion() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("systemVersion");
		return modelAndView;
	}

	// 意见反馈
	@RequestMapping(value = "feedback.do")
	public ModelAndView feedback() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Feedback");
		return modelAndView;
	}

	// 系统帮助
	@RequestMapping(value = "systemhelp.do")
	public ModelAndView systemhelp() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("systemhelp");
		return modelAndView;
	}

	@RequestMapping(value = "feedbacksend.do")
	public ModelAndView feedbacksend(String theme, String message) {
		try {
			sendemail(theme, message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Feedback");
		return modelAndView;
	}

	// 发送邮件的方法
	public void sendemail(String theme, String messages) throws Exception {
		Properties prop = new Properties();
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.host", "smtp.163.com");
		prop.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(prop);
		session.setDebug(true);
		Message message = createSimpleMail(session, theme, messages);
		Transport ts = session.getTransport();
		ts.connect("15178945588@163.com", "abc123456");
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
	}

	// 静态的消息
	public static MimeMessage createSimpleMail(Session session, String theme, String messages) throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("15178945588@163.com"));
		// 指明邮件的收件人
		message.addRecipients(Message.RecipientType.TO, "1004519755@qq.com");
		// 邮件的标题
		message.setSubject(theme);
		// 邮件的文本内容
		message.setText(messages);
		message.saveChanges();
		// 返回创建好的邮件对象
		return message;
	}

}
