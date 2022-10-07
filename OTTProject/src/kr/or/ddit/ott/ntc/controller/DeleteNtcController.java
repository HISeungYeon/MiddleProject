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

@WebServlet("/ntc/delete.do")
public class DeleteNtcController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] ntcNums = req.getParameterValues("ntcNum");

		// 1. 서비스 객체 생성하기
		INtcService ntcService = NtcService.getInstance();

		// 2. 삭제처리
		for(String ntcNum: ntcNums) {
			NtcVO vo = ntcService.getNtc(ntcNum);
			int cnt = ntcService.removeNtc(ntcNum);
			
		}

		resp.getWriter().write("성공");

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
