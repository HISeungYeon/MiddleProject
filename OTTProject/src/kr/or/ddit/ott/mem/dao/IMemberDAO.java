package kr.or.ddit.ott.mem.dao;

import java.util.List;

import kr.or.ddit.ott.mem.vo.MemberVO;

public interface IMemberDAO {

	public int membership(MemberVO mv);

	public int duplicateEmail(String memEm);
	
	public MemberVO login(MemberVO mv);
	
	public int findPw(MemberVO mv);

	public List<MemberVO> MypageList(MemberVO mv);
	
	public int MyPageMemberUpdate(MemberVO mv);
	
	public int MyPageMemberDelete(String memEm);
	
	public List<MemberVO> getAllMemList();
}
