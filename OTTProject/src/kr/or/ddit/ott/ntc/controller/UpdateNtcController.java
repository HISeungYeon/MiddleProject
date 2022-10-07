package kr.or.ddit.ott.ntc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.ntc.service.INtcService;
import kr.or.ddit.ott.ntc.service.NtcService;
import kr.or.ddit.ott.ntc.vo.NtcVO;


@MultipartConfig
@WebServlet("/ntc/update.do")
public class UpdateNtcController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ntcNum = req.getParameter("ntcNum");

		// 1. 서비스 객체 생성하기
		INtcService ntcService = NtcService.getInstance();
		NtcVO vo = ntcService.getNtc(ntcNum);

		req.setAttribute("vo", vo);

		req.getRequestDispatcher("/view/ntc/editForm.jsp").forward(req, resp);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 요청파라미터 정보 가져오기
		String ntcNum = req.getParameter("ntcNum");
		String ntcTit = req.getParameter("ntcTit");
		String ntcCon = req.getParameter("ntcCon");

		// 2. 서비스 객체 생성하기
		INtcService ntcService = NtcService.getInstance();

		// 3. 회원정보 수정하기
		NtcVO vo = new NtcVO();
		vo.setNtcNum(ntcNum);
		vo.setNtcTit(ntcTit);
		vo.setNtcCon(ntcCon);

		int cnt = ntcService.updateNtc(vo);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		// 4. 목록 조회 화면으로 이동
		String redirectUrl = req.getContextPath() + "/ntc/list.do";

		resp.sendRedirect(redirectUrl);

	}
}
