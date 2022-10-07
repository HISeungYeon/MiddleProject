package kr.or.ddit.ott.wachis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.wachis.service.IWacHisService;
import kr.or.ddit.ott.wachis.service.WacHisService;
import kr.or.ddit.ott.wachis.vo.WacHisVO;

@WebServlet("/wachis/list.do")
public class ListWacHisController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO memberVO = (MemberVO)req.getSession().getAttribute("vo");
		
		// 로그인 되어있지 않을 경우
		if(memberVO == null) {
			
			resp.sendRedirect("/OTTProject/member/login.do");  // redirect로 주소줄 표시되게
			return; 
		}
		
		// 1. 서비스 객체 생성하기
		IWacHisService wachisService = WacHisService.getInstance();

		// 2. 회원목록 조회
		List<WacHisVO> wachisList = wachisService.WacHisList(memberVO.getMemEm());

		req.setAttribute("wachisList", wachisList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/wachis/list.jsp");

		dispatcher.forward(req, resp); // 뷰 페이지로 전달.

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
