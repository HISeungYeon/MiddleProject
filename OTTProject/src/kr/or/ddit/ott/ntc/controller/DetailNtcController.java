package kr.or.ddit.ott.ntc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.ntc.service.INtcService;
import kr.or.ddit.ott.ntc.service.NtcService;
import kr.or.ddit.ott.ntc.vo.NtcVO;

@WebServlet("/ntc/detail.do")
public class DetailNtcController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ntcNum = req.getParameter("ntcNum");

		// 1. 서비스 객체 생성하기
		INtcService ntcService = NtcService.getInstance();
		NtcVO vo = ntcService.getNtc(ntcNum);
		
		req.setAttribute("vo", vo);

		req.getRequestDispatcher("/view/ntc/detail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
