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

@WebServlet("/wachis/insert.do")
public class InsertWacHisController extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String memNum = req.getParameter("memNum");
		String vdodtlNum = req.getParameter("vdodtlNum");
		
		IWacHisService wachisService = WacHisService.getInstance();
		
		WacHisVO vo = new WacHisVO();
		vo.setMemNum(memNum);
		vo.setVdodtlNum(vdodtlNum);
		
		int cnt = wachisService.registerWacHis(vo);
		
		String msg = "";
		
		if (cnt > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}
		
		resp.getWriter().write(msg);
		System.out.println("ㅠㅠ " + msg);
		
	}

}
