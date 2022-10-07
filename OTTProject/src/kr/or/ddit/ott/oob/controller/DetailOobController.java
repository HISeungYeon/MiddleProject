package kr.or.ddit.ott.oob.controller;

import java.io.IOException;
import java.util.List;

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
import kr.or.ddit.ott.rep.vo.RepVO;

@WebServlet("/oob/detail.do")
public class DetailOobController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Get 처리 시작");
		req.setCharacterEncoding("UTF-8");
		
		String oobNum = req.getParameter("oobNum");	
		System.out.println("oobNum이 뭐야  " + oobNum);
		
		IOobService oobService = OobService.getInstance();
		OobVO ov = oobService.getOob(oobNum);
		
		System.out.println("ov 체크: " + ov);
		
		req.setAttribute("ov", ov);
		
			
		//댓글리스트
		IRepService repService = RepService.getInstance();
		RepVO rv = new RepVO();
		rv.setOobNum(oobNum);
		
		List<RepVO> repList = repService.getAllRepList(rv);
		System.out.println("list 체크:" + repList);
		
		req.setAttribute("repList", repList);
		
		
		req.getRequestDispatcher("/view/oob/detail.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doGet(req, resp);   // 승연이의 크나큼 미 스테이크
		
		System.out.println("Post 처리 시작");
		
		String repNum = req.getParameter("repNum");
		String oobNum = req.getParameter("oobNum");
		String repCon = req.getParameter("repCon");
		String repSit = req.getParameter("repSit");
		
		IRepService repService = RepService.getInstance();
		
		RepVO rv = new RepVO();
		rv.setRepNum(repNum);
		rv.setOobNum(oobNum);
		rv.setRepCon(repCon);
		rv.setRepSit(repSit);
		
		int cnt = repService.registerRep(rv);
		
		String msg = "";
		
		if(cnt > 0) {
			//성공
			msg = "success";
		}else {
			// 실패
			msg = "fail";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		resp.getWriter().write(msg);

	}

}
