package kr.or.ddit.ott.vdodtl.controller;

import java.io.IOException;
import java.util.List;

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


@WebServlet("/vdodtl/detail.do")
public class DetailVdodtlController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String vdodtlNum = req.getParameter("vdodtlNum");

		// 1. 서비스 객체 생성하기
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		VdodtlVO vo = vdodtlService.getVdodtl(vdodtlNum);
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		if (vo.getAtchFileId() > 0) { // 첨부파일 존재하면.
			// 1-2. 첨부파일 정보 조회
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(vo.getAtchFileId());
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
			
			req.setAttribute("atchFileList", atchFileList);
			
		}

		req.setAttribute("vo", vo);

		req.getRequestDispatcher("/view/vdodtl/detail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
