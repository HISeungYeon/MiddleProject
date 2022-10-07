package kr.or.ddit.ott.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;

@WebServlet("/member/passwordfind.do")
public class PasswordFindController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/member/findPw.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("넘어온 임시번호 값: " + req.getParameter("emailNum"));
		String memEm = req.getParameter("memEm");
		
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
			msg.setSubject("D++ 임시 비밀번호 전송드립니다.");
			// 메일 내용
			msg.setText("임시 비밀번호를 입력해주세요.\n임시 번호는 : " + cerNum + " 입니다. \n\nOTT서비스의 차원이 다른 플랫폼!");

			Transport.send(msg);
			System.out.println("임시비밀번호 발송");

		} catch (Exception e) {
			e.printStackTrace();
		}

		IMemberService memService = MemberService.getInstance();
		MemberVO mv = new MemberVO();
		mv.setMemEm(memEm);
		mv.setMemPw(cerNum);
		int vo = memService.memberPwfind(mv);
		System.out.println(vo);
		
		if (vo > 0) {
			System.out.println("수정 성공!");
			resp.getWriter().write("OK");
		} else {
			System.out.println("수정 실패!");
		}

	}
}
