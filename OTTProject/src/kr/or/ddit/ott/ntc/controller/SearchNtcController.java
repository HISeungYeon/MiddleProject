package kr.or.ddit.ott.ntc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.ntc.service.INtcService;
import kr.or.ddit.ott.ntc.service.NtcService;
import kr.or.ddit.ott.ntc.vo.NtcVO;

@WebServlet(value = "/ntc/search.do")
public class SearchNtcController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 서비스 객체 생성하기
		INtcService ntcService = NtcService.getInstance();
		NtcVO vo = new NtcVO();
		vo.setNtcTit(req.getParameter("ntcTit"));
		// 2. 검색회원 목록 조회
		List<NtcVO> ntcList = ntcService.searchNtcList(vo);
		
		req.setAttribute("ntcList", ntcList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/ntc/searchNtc.jsp");

		dispatcher.forward(req, resp); // 뷰 페이지로 전달.
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
