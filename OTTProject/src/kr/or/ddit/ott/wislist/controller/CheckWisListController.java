package kr.or.ddit.ott.wislist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.wislist.service.IWisListService;
import kr.or.ddit.ott.wislist.service.WisListService;
import kr.or.ddit.ott.wislist.vo.WisListVO;


@WebServlet("/wislist/check.do")
public class CheckWisListController extends HttpServlet {
   
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		WisListVO vo = new WisListVO();
		vo.setMemNum(req.getParameter("memNum"));
		vo.setVdodtlNum(req.getParameter("vdodtlNum"));
		
		
		IWisListService wislistService = WisListService.getInstance();
		
		int cnt = wislistService.listCheck(vo);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		resp.getWriter().write(msg);
	}

}
