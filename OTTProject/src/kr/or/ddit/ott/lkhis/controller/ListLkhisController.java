package kr.or.ddit.ott.lkhis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.lkhis.service.ILkhisService;
import kr.or.ddit.ott.lkhis.service.LkhisService;
import kr.or.ddit.ott.lkhis.vo.LkhisVO;
import kr.or.ddit.ott.mem.vo.MemberVO;

@WebServlet(value = "/lkhis/list.do")
public class ListLkhisController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVO memberVO = (MemberVO) req.getSession().getAttribute("vo");

		// 만약 로그인을 하지 않았다묜
		if (memberVO == null) {

			resp.sendRedirect("/OTTProject/member/login.do"); // redirect로 주소줄 표시되겡
			return;
		}
		
		// 1. 서비스 객체 생성하기
		ILkhisService lkhistService = LkhisService.getInstance();

		// 2. 회원목록 조회
		List<LkhisVO> lkhisList = lkhistService.searchLkhis(memberVO.getMemEm());

		req.setAttribute("lkhisList", lkhisList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/lkhis/list.jsp");

		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
