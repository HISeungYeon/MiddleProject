package kr.or.ddit.ott.ntc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.ntc.service.INtcService;
import kr.or.ddit.ott.ntc.service.NtcService;
import kr.or.ddit.ott.ntc.vo.NtcVO;

@WebServlet("/ntc/regist.do")
public class InsertNtcController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/ntc/registForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
		// 1. 파라미터 데이터 가져오기
		String ntcNum = req.getParameter("ntcNum");
		String ntcTit = req.getParameter("ntcTit");
		String ntcCon = req.getParameter("ntcCon");

		// 2. 서비스 객체 생성하기
		INtcService ntcService = NtcService.getInstance();
//		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		// 3. 회원정보 등록하기
		NtcVO vo = new NtcVO();
		vo.setNtcNum(ntcNum);
		vo.setNtcTit(ntcTit);
		vo.setNtcCon(ntcCon);

		int cnt = ntcService.registerNtc(vo);

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
//		req.getRequestDispatcher("/member/list.do").forward(req, resp);

		String redirectUrl = req.getContextPath() + "/ntc/list.do";

		resp.sendRedirect(redirectUrl);

	}
}
