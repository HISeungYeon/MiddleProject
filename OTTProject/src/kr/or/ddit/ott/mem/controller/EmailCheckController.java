package kr.or.ddit.ott.mem.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/eMailCheck.do")
public class EmailCheckController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/member/membership.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("넘어온 이메일 값: " + req.getParameter("memEm"));
		System.out.println("넘어온 인증번호 값: " + req.getParameter("emailNum"));

		String cerNum = req.getParameter("emailNum");
		System.out.println(cerNum);

		String host = "smtp.naver.com";
		String user = "pgw9595@naver.com"; // 자신의 네이버 계정
		String password = "na5864312!!"; // 자신의 네이버 패스워드

		// 메일 받을 주소
		String to_email = req.getParameter("memEm");

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "디지니++ 대표 이승연"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("D++ 가족이 되어주신걸 환영합니다!");
			// 메일 내용
			msg.setText("가입을 위해 인증번호를 입력해주세요.\n인증 번호는 : " + cerNum + " 입니다. \n\nOTT서비스의 차원이 다른 플랫폼!");

			Transport.send(msg);
			System.out.println("회원가입 인증메일 전송");

		} catch (Exception e) {
			e.printStackTrace();
		}

		resp.getWriter().write("OK");

	}
}
