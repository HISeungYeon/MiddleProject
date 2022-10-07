package kr.or.ddit.ott.mem.service;

import java.util.List;

import kr.or.ddit.ott.mem.dao.IMemberDAO;
import kr.or.ddit.ott.mem.dao.MemberDAO;
import kr.or.ddit.ott.mem.vo.MemberVO;

public class MemberService implements IMemberService {

	private static IMemberService memService;

	private IMemberDAO memDao;

	private MemberService() {
		memDao = MemberDAO.getInstance();
	}

	public static IMemberService getInstance() {
		if (memService == null) {
			memService = new MemberService();
		}

		return memService;
	}

	@Override
	public int registerMember(MemberVO mv) {
		int cnt = memDao.membership(mv);
		return cnt;
	}

	@Override
	public int dupleEmail(String memEm) {
		int cnt = memDao.duplicateEmail(memEm);
		return cnt;
	}

	@Override
	public MemberVO memberLogin(MemberVO mv) {
		MemberVO cnt = memDao.login(mv);
		return cnt;
	}

	@Override
	public int memberPwfind(MemberVO mv) {
		int cnt = memDao.findPw(mv);
		return cnt;
	}

	@Override
	public List<MemberVO> searchMemberList(MemberVO mv) {
		List<MemberVO> memList = memDao.MypageList(mv);
		return memList;
	}

	@Override
	public int MemberUpdate(MemberVO mv) {
		int cnt = memDao.MyPageMemberUpdate(mv);
		return cnt;
	}

	@Override
	public int MemberDelete(String memEm) {
		int cnt = memDao.MyPageMemberDelete(memEm);
		return cnt;
	}

	@Override
	public List<MemberVO> getAllMemList() {
		List<MemberVO> memList = memDao.getAllMemList();
		return memList;
	}



}
