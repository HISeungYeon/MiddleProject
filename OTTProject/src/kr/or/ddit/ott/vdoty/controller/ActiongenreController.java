package kr.or.ddit.ott.vdoty.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ott.mem.service.IMemberService;
import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.vdoty.service.IVdoTyService;
import kr.or.ddit.ott.vdoty.service.VdoTyService;
import kr.or.ddit.ott.vdoty.vo.VdoTyVO;

@WebServlet("/vdoty/action.do")
public class ActiongenreController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/vdoty/action.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vdotyNum = req.getParameter("vdotyNum");
		String vdotyNm = req.getParameter("vdotyNm");
		
		IVdoTyService vdoTyService = VdoTyService.getInstance();
		
		VdoTyVO vv = new VdoTyVO();
		vv.setVdotyNum(vdotyNum);
		vv.setVdotyNm(vdotyNm);
		List<VdoTyVO> vdotyList = vdoTyService.searchVdoTyList(vv);

		if (vdotyList != null) {
			System.out.println("불러오거라");
		} else {
			System.out.println("실패유~");
		}
	}

}
