package kr.or.ddit.ott.wislist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.wislist.service.IWisListService;
import kr.or.ddit.ott.wislist.service.WisListService;
import kr.or.ddit.ott.wislist.vo.WisListVO;


@WebServlet("/wislist/del.do")
public class DeleteWisListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		WisListVO vo = new WisListVO();
		vo.setMemNum(req.getParameter("memNum"));
		vo.setVdodtlNum(req.getParameter("vdodtlNum"));
		
		
		IWisListService wislistService = WisListService.getInstance();
		
		int cnt = wislistService.delWisList(vo);
		
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
