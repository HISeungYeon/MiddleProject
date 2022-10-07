package kr.or.ddit.ott.wislist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.wislist.service.IWisListService;
import kr.or.ddit.ott.wislist.service.WisListService;
import kr.or.ddit.ott.wislist.vo.WisListVO;

@WebServlet(value = "/wislist/list.do")
public class WisListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVO memberVO = (MemberVO)req.getSession().getAttribute("vo");
		
		//만약 로그인을 하지 않았다묜
		if(memberVO == null) {
			
			resp.sendRedirect("/OTTProject/member/login.do");  // redirect로 주소줄 표시되겡
			return; 
		}
		
		
		// 1. 서비스 객체 생성하기
		IWisListService wisListService = WisListService.getInstance();
		

		// 2. 회원목록 조회
		List<WisListVO> wisList = wisListService.searchWisList(memberVO.getMemEm());
//		System.out.println("apapapap"+ wisList);
		
		req.setAttribute("wisList", wisList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/wislist/list.jsp");

		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
