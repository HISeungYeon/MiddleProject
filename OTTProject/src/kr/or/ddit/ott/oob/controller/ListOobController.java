package kr.or.ddit.ott.oob.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.oob.service.IOobService;
import kr.or.ddit.ott.oob.service.OobService;
import kr.or.ddit.ott.oob.vo.OobVO;
import kr.or.ddit.ott.rep.service.IRepService;
import kr.or.ddit.ott.rep.service.RepService;
import kr.or.ddit.ott.rep.vo.RepVO;

@WebServlet(value = "/oob/list.do")
public class ListOobController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("oobList Get 처리 시작");
		req.setCharacterEncoding("UTF-8");
		IOobService oobService = OobService.getInstance();
		
		String memNum = (String) req.getSession().getAttribute("memNum");
		
		System.out.println("memNum?? : " + memNum);
		List<OobVO> oobList = new ArrayList<OobVO>();
		if(Integer.parseInt(memNum) == 0) {
			oobList = oobService.getAllOobList();			
		}else {
			oobList = oobService.getMemOobList(memNum);
		}
		
				
		List<String> sitList = new ArrayList<String>();
		for(int i=0; i<oobList.size(); i++) {
			int ugjhb = oobService.getRepSit(oobList.get(i).getOobNum());
			System.out.println(ugjhb);
			if(oobService.getRepSit(oobList.get(i).getOobNum()) == 1) {
				sitList.add("답변완료");
			} else {
				sitList.add("답변대기");
			}
		}
		
		req.setAttribute("oobList", oobList);
		req.setAttribute("sitList", sitList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/oob/list.jsp");
//		
		dispatcher.forward(req, resp);
//		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
