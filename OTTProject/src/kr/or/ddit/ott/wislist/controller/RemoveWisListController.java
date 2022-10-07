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


@WebServlet("/wislist/remove.do")
public class RemoveWisListController extends HttpServlet {
	
	 @Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      String[] wislistNums = req.getParameterValues("wislistNum");
	      
	      IWisListService wislistService = WisListService.getInstance();
	      
	      for(String wislistNum: wislistNums) {
				WisListVO vo = wislistService.getWisList(wislistNum);
				int cnt = wislistService.removeWisList(wislistNum);
	      
	      }
	      resp.getWriter().write("성공");
	      
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      doGet(req, resp);
	   }

	}
