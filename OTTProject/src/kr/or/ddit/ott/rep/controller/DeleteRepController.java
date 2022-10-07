package kr.or.ddit.ott.rep.controller;

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
import kr.or.ddit.ott.rep.service.IRepService;
import kr.or.ddit.ott.rep.service.RepService;

@WebServlet("/rep/delete.do")
public class DeleteRepController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String repNum = req.getParameter("repNum");

		IRepService repService = RepService.getInstance();

		int cnt = repService.removeRep(repNum);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		String oobNum = req.getParameter("oobNum");
		
		String redirectUrl = req.getContextPath() + "/oob/detail.do?oobNum=" + oobNum;

		resp.sendRedirect(redirectUrl);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
