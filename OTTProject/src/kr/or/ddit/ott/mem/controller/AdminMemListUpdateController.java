package kr.or.ddit.ott.mem.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;


@WebServlet("/member/adminMemList.do")
public class AdminMemListUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMemberService memService = MemberService.getInstance();
		
		List<MemberVO> memList = memService.getAllMemList();
		
		req.setAttribute("memList", memList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/member/adminMemList.jsp");
		
		dispatcher.forward(req, resp);
		
	
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}

}
