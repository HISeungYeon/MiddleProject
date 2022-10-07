package kr.or.ddit.ott.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;


@WebServlet("/member/adminMemDel.do")
public class AdminMemListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] memList = req.getParameterValues("memEm");
		
		IMemberService memberService = MemberService.getInstance();
		
		for (String memEm : memList) {
			
			 memberService.MemberDelete(memEm);
		}
		
		resp.getWriter().write("성공");
	}


}
