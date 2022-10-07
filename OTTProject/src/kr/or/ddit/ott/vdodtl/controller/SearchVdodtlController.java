package kr.or.ddit.ott.vdodtl.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.vdodtl.service.IVdodtlService;
import kr.or.ddit.ott.vdodtl.service.VdodtlService;
import kr.or.ddit.ott.vdodtl.vo.SearchVO;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;

@WebServlet(value = "/main/search.do")
public class SearchVdodtlController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 서비스 객체 생성하기
		String part = req.getParameter("part");
		String searchData = req.getParameter("searchData");
		String streFileNm = req.getParameter("streFileNm");
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		SearchVO sv = new SearchVO();
		sv.setPart(part);
		sv.setSearchData("%" + searchData + "%");
		sv.setStreFileNm(streFileNm);
		
		// 2. 검색회원 목록 조회
		List<VdodtlVO> vdodtlList = vdodtlService.searchVdodtlList(sv);
		
		req.setAttribute("vdodtlList", vdodtlList);
		req.setAttribute("streFileNm", streFileNm);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/main/search.jsp");

		dispatcher.forward(req, resp); // 뷰 페이지로 전달.
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
