package kr.or.ddit.ott.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.SeekableByteChannel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;


@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/member/login.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("로그인 페이지 시작");
		
		// 1. 파라미터 데이터 가져오기
		String memEm = req.getParameter("memEm");
		String memPw = req.getParameter("memPw");
		HttpSession session = req.getSession();

		IMemberService memService = MemberService.getInstance();

		// 2. 서비스 객체 생성하기
		MemberVO mv = new MemberVO();
		mv.setMemEm(memEm);
		mv.setMemPw(memPw);
		System.out.println("여긴 그럼 뜨냐?");
		System.out.println(mv);
		MemberVO vo = memService.memberLogin(mv);
		System.out.println("넘버 뜨나용? " + vo);
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		// 3. 성공여부 확인하는 콘솔창 메시지
		if (vo != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("memNum", vo.getMemNum());
			session.setAttribute("vo", vo);
			out.print("{\"result\": \"ok\"}");
		} else {
			System.out.println("로그인 실패!");
			out.print("{\"result\": \"나가!\"}");
		}

		

	}
}
