package kr.or.ddit.ott.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;

@WebServlet("/member/memberupdate.do")
public class MemberUpdateController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/member/memberlistupdate.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 파라미터 데이터 가져오기
		String memEm = req.getParameter("memEm");
		String memNm = req.getParameter("memNm");
		String memPw = req.getParameter("memPw");
		String memTel = req.getParameter("memTel");
		String memBir = req.getParameter("memBir");
		String memNal = req.getParameter("memNal");

		// 2. 서비스 객체 생성하기 해봅시다
		IMemberService memService = MemberService.getInstance();
		
		

		// 3. 회원정보 등록하기
		MemberVO mv = new MemberVO();
		mv.setMemEm(memEm);
		mv.setMemNm(memNm);
		mv.setMemPw(memPw);
		mv.setMemTel(memTel);
		mv.setMemBir(memBir);
		mv.setMemNal(memNal);
		System.out.println("여기담기나?" + mv);
		int vo = memService.MemberUpdate(mv);
		System.out.println("여기제발 담기람마" + vo);

		String msg = "";

		if (vo > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}

		resp.getWriter().write(msg);
		
		HttpSession session = req.getSession();
		session.setAttribute("vo", mv);
	}
}
