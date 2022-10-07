package kr.or.ddit.ott.vdodtl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comm.service.AtchFileServiceImpl;
import comm.service.IAtchFileService;
import comm.vo.AtchFileVO;
import kr.or.ddit.ott.vdodtl.service.IVdodtlService;
import kr.or.ddit.ott.vdodtl.service.VdodtlService;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;

@MultipartConfig
@WebServlet("/vdodtl/insert.do")
public class InsertVdodtlController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/vdodtl/insertForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 파라미터 데이터 가져오기
		String vdodtlNum = req.getParameter("vdodtlNum");
		String vdotyNum = req.getParameter("vdotyNum");
		String vdolevNum = req.getParameter("vdolevNum");
		String vdodtlNm = req.getParameter("vdodtlNm");
		String vdodtlDtl = req.getParameter("vdodtlDtl");
		String vdodtlSumy = req.getParameter("vdodtlSumy");

		// 2. 서비스 객체 생성하기
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		// 첨부파일 저장하기
		AtchFileVO atchFileVO = fileService.saveAtchFileList(req);

		// 3. 영상물 등록하기
		VdodtlVO vo = new VdodtlVO();
		vo.setVdodtlNum(vdodtlNum);
		vo.setVdotyNum(vdotyNum);
		vo.setVdolevNum(vdolevNum);
		vo.setVdodtlNm(vdodtlNm);
		vo.setVdodtlDtl(vdodtlDtl);
		vo.setVdodtlSumy(vdodtlSumy);
		System.out.println(atchFileVO);
		vo.setAtchFileId(atchFileVO.getAtchFileId());

		int cnt = vdodtlService.registerVdodtl(vo);

		String msg = "";

		if (cnt > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		// 4. 목록 조회 화면으로 이동

		String redirectUrl = req.getContextPath() + "/vdodtl/list.do";

		resp.sendRedirect(redirectUrl);

	}
}
