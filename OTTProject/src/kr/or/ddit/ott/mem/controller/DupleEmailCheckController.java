package kr.or.ddit.ott.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;

@WebServlet("/member/duplicateEmail.do")
public class DupleEmailCheckController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 파라미터 데이터 가져오기
		String memEm = req.getParameter("memEm");

		PrintWriter out = resp.getWriter();

		// 2. 서비스 객체 생성하기
		IMemberService memService = MemberService.getInstance();

		int cnt = memService.dupleEmail(memEm);

		// 3. 성공여부 확인하는 콘솔창 메시지
		if (cnt >= 1) {
			System.out.println("이미 존재하는 이메일 입니다.");
		} else if (cnt == 0) {
			System.out.println("사용 가능한 이메일 입니다.");
		}

		out.write(cnt + "");
		
		// 4. 목록 조회 화면으로 이동
//		req.getRequestDispatcher("/member/login.do").forward(req, resp);

//		String redirectUrl = req.getContextPath() + "/member/login.do";
//
//		resp.sendRedirect(redirectUrl);

	}
}
