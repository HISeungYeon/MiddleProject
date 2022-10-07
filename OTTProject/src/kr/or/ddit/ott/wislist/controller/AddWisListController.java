package kr.or.ddit.ott.wislist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ott.wislist.service.IWisListService;
import kr.or.ddit.ott.wislist.service.WisListService;
import kr.or.ddit.ott.wislist.vo.WisListVO;

@WebServlet("/wislist/add.do")
public class AddWisListController extends HttpServlet{
	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getRequestDispatcher("/view/wislist/addForm.jsp").forward(req, resp);
//	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String memNum = req.getParameter("memNum");
		String vdodtlNum = req.getParameter("vdodtlNum");
		
		IWisListService wisListService = WisListService.getInstance();
		
		WisListVO vo = new WisListVO();
		vo.setMemNum(memNum);
		vo.setVdodtlNum(vdodtlNum);
		
		int cnt = wisListService.addWisList(vo);
		
		String msg = "";
		
		if (cnt > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}
		
		resp.getWriter().write(msg);
	}

}
