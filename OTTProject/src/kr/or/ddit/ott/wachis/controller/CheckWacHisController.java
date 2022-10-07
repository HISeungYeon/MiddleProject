package kr.or.ddit.ott.wachis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.wachis.service.IWacHisService;
import kr.or.ddit.ott.wachis.service.WacHisService;
import kr.or.ddit.ott.wachis.vo.WacHisVO;


@WebServlet("/wachis/check.do")
public class CheckWacHisController extends HttpServlet {
   
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		WacHisVO vo = new WacHisVO();
		vo.setMemNum(req.getParameter("memNum"));
		vo.setVdodtlNum(req.getParameter("vdodtlNum"));
		
		
		IWacHisService wachisService = WacHisService.getInstance();
		
		int cnt = wachisService.listcheck(vo);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		resp.getWriter().write(msg);
	}

}
