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
import kr.or.ddit.ott.oob.vo.OobVO;

@WebServlet("/oob/update.do")
public class UpdateOobController extends HttpServlet{
	private static final long serialVersionUID = 1L; //?
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oobNum = req.getParameter("oobNum");
		
		IOobService oobService = OobService.getInstance();
		OobVO ov = oobService.getOob(oobNum);
		
		req.setAttribute("ov", ov);
		req.getRequestDispatcher("/view/oob/updateForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oobNum = req.getParameter("oobNum");
		String memNum = req.getParameter("memNum");
		String oobTit = req.getParameter("oobTit");
		String oobCon = req.getParameter("oobCon");
		
		IOobService oobService = OobService.getInstance();
		
		OobVO ov = new OobVO();
		ov.setOobNum(oobNum);
		ov.setMemNum(memNum);
		ov.setOobTit(oobTit);
		ov.setOobCon(oobCon);
		
		int cnt = oobService.modifyOob(ov);
		
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
		
		String redirectUrl = req.getContextPath() + "/oob/list.do";
		
		resp.sendRedirect(redirectUrl);
		
		oobService.modifyOob(ov);
		
	}

}
