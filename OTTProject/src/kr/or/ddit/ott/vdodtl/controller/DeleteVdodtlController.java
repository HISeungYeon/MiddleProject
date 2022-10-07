package kr.or.ddit.ott.vdodtl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.vdodtl.service.IVdodtlService;
import kr.or.ddit.ott.vdodtl.service.VdodtlService;

@WebServlet("/vdodtl/delete.do")
public class DeleteVdodtlController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String vdodtlNum = req.getParameter("vdodtlNum");

		// 1. 서비스 객체 생성하기
		IVdodtlService vdodtlService = VdodtlService.getInstance();

		// 2. 삭제처리
		int cnt = vdodtlService.removeVdodtl(vdodtlNum);

		String msg = "";

		if (cnt > 0) {
			msg = "성공!!!!!!!!~!~";
			msg = "실패!!!!!!!!";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		// 3. 목록화면으로 이동하기
		String redirectUrl = req.getContextPath() + "/vdodtl/list.do";

		resp.sendRedirect(redirectUrl);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
