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

@WebServlet("/member/vdotylist.do")
public class RomancegenreController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/view/member/memberlist.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memEm = req.getParameter("memEm");
		
		IMemberService memService = MemberService.getInstance();
		
		MemberVO mv = new MemberVO();
		mv.setMemEm(memEm);
		List<MemberVO> memList = memService.searchMemberList(mv);

		if (memList != null) {
			System.out.println("불러오거라");
		} else {
			System.out.println("실패유~");
		}
	}

}
