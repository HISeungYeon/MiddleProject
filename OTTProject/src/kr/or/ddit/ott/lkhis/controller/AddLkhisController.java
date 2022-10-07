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
import kr.or.ddit.ott.vdodtl.service.IVdodtlService;
import kr.or.ddit.ott.vdodtl.service.VdodtlService;


@WebServlet("/lkhis/add.do")
public class AddLkhisController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String memNum = req.getParameter("memNum");
		String vdodtlNum = req.getParameter("vdodtlNum");
		
		ILkhisService lkhisService = LkhisService.getInstance();
		IVdodtlService vdodtlService = VdodtlService.getInstance();
		
		LkhisVO vo = new LkhisVO();
		vo.setMemNum(memNum);
		vo.setVdodtlNum(vdodtlNum);
		
		int cnt = lkhisService.addLkhis(vo);
		int cnt1 = vdodtlService.incLike(vdodtlNum);
		
		
		String msg = "";
		
		if (cnt > 0 && cnt1 > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}
		
		resp.getWriter().write(msg);
		
	}

}
