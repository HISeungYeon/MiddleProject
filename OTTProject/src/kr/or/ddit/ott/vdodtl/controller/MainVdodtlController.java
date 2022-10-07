package kr.or.ddit.ott.vdodtl.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.service.AtchFileServiceImpl;
import comm.service.IAtchFileService;
import comm.vo.AtchFileVO;
import kr.or.ddit.ott.vdodtl.service.IVdodtlService;
import kr.or.ddit.ott.vdodtl.service.VdodtlService;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;

@WebServlet(value = "/main/main.do")
public class MainVdodtlController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 서비스 객체 생성하기
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		
		// 2. 동영상 목록 조회
		List<VdodtlVO> vdodtlList = vdodtlService.getAllVdodtlList();
		List<VdodtlVO> rankList = vdodtlService.rankList();
		
		req.setAttribute("vdodtlList", vdodtlList);
		req.setAttribute("rankList", rankList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/main/main.jsp");

		dispatcher.forward(req, resp); // 뷰 페이지로 전달.
		
		String streFileNm = req.getParameter("streFileNm") != null ? 
				req.getParameter("streFileNm") : "";
		
		// 파일 정보 조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		AtchFileVO fileVO = new AtchFileVO();
		fileVO.setStreFileNm(streFileNm);
		fileVO = fileService.getAtchFileDetail(fileVO);

	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		doGet(req, resp);
	}
}
