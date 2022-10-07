package kr.or.ddit.ott.lkhis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.lkhis.service.ILkhisService;
import kr.or.ddit.ott.lkhis.service.LkhisService;
import kr.or.ddit.ott.lkhis.vo.LkhisVO;


@WebServlet("/lkhis/remove.do")
public class RemoveLkhisController extends HttpServlet {
	
	 @Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      String[] lkhisNums = req.getParameterValues("lkhisNum");
	      
	      ILkhisService lkhisService = LkhisService.getInstance();
	      
	      for(String lkhisNum: lkhisNums) {
				LkhisVO vo = lkhisService.getLkhis(lkhisNum);
				int cnt = lkhisService.removeLkhis(lkhisNum);
	      
	      }
	      resp.getWriter().write("성공");
	      
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      doGet(req, resp);
	   }

	}
