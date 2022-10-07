package kr.or.ddit.ott.wachis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.wachis.service.IWacHisService;
import kr.or.ddit.ott.wachis.service.WacHisService;
import kr.or.ddit.ott.wachis.vo.WacHisVO;


@WebServlet("/wachis/delete.do")
public class DeleteWacHisController extends HttpServlet {
	
	 @Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      String[] wachisNums = req.getParameterValues("wachisNum");
	      
	      IWacHisService wachisService = WacHisService.getInstance();
	      
	      for(String wachisNum: wachisNums) {
				WacHisVO vo = wachisService.getWacHis(wachisNum);
				int cnt = wachisService.removeWacHis(wachisNum);
	      
	      }
	      resp.getWriter().write("성공");
	      
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      doGet(req, resp);
	   }

	}
