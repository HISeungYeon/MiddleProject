package kr.or.ddit.ott.oob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.oob.service.IOobService;
import kr.or.ddit.ott.oob.service.OobService;

@WebServlet("/oob/delete.do")
public class DeleteOobController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String oobNum = req.getParameter("oobNum");
		
		IOobService oobService = OobService.getInstance();
		
		int cnt = oobService.removeOob(oobNum);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		String redirectUrl = req.getContextPath() + "/oob/list.do";
		
		resp.sendRedirect(redirectUrl);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
