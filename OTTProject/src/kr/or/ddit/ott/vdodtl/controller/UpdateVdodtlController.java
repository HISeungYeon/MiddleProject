package kr.or.ddit.ott.vdodtl.controller;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/vdodtl/update.do")
public class UpdateVdodtlController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String vdodtlNum = req.getParameter("vdodtlNum");

		// 1. 서비스 객체 생성하기
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		VdodtlVO vo = vdodtlService.getVdodtl(vdodtlNum);
		
		if(vo.getAtchFileId() > 0) {
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(vo.getAtchFileId());
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);

			req.setAttribute("atchFileList", atchFileList);
		}

		req.setAttribute("vo", vo);

		req.getRequestDispatcher("/view/vdodtl/updateForm.jsp").forward(req, resp);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 요청파라미터 정보 가져오기
		String vdodtlNum = req.getParameter("vdodtlNum");
		String vdotyNum = req.getParameter("vdotyNum");
		String vdolevNum = req.getParameter("vdolevNum");
		String vdodtlNm = req.getParameter("vdodtlNm");
		String vdodtlDtl = req.getParameter("vdodtlDtl");
		String vdodtlSumy = req.getParameter("vdodtlSumy");
		String atchFileId = req.getParameter("fileId");

		// 2. 서비스 객체 생성하기
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		// 첨부파일 저장하기
		AtchFileVO atchFileVO = fileService.saveAtchFileList(req);
		System.out.println("atch파일:::"+atchFileVO);
		// 3. 회원정보 수정하기
		VdodtlVO vo = new VdodtlVO();
		vo.setVdodtlNum(vdodtlNum);
		vo.setVdotyNum(vdotyNum);
		vo.setVdolevNum(vdolevNum);
		vo.setVdodtlNm(vdodtlNm);
		vo.setVdodtlDtl(vdodtlDtl);
		vo.setVdodtlSumy(vdodtlSumy);

		if(atchFileVO == null) {
			vo.setAtchFileId(Long.parseLong(atchFileId));
		} else {
			vo.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = vdodtlService.updateVdodtl(vo);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		// 4. 목록 조회 화면으로 이동
		String redirectUrl = req.getContextPath() + "/vdodtl/list.do";

		resp.sendRedirect(redirectUrl);

	}
}
