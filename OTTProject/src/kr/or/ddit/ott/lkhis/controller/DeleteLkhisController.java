package kr.or.ddit.ott.lkhis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.lkhis.service.ILkhisService;
import kr.or.ddit.ott.lkhis.service.LkhisService;
import kr.or.ddit.ott.lkhis.vo.LkhisVO;



@WebServlet("/lkhis/delete.do")
public class DeleteLkhisController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		LkhisVO vo = new LkhisVO();
		vo.setMemNum(req.getParameter("memNum"));
		vo.setVdodtlNum(req.getParameter("vdodtlNum"));
		
		
		ILkhisService lkhisService = LkhisService.getInstance();
		
		int cnt = lkhisService.delLkhis(vo);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		resp.getWriter().write(msg);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
