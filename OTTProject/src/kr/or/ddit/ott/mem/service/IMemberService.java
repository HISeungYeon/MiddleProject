package kr.or.ddit.ott.mem.service;

import java.util.List;

import kr.or.ddit.ott.mem.vo.MemberVO;

public interface IMemberService {

	public int registerMember(MemberVO mv);
	
	public int dupleEmail(String memEm);
	
	public MemberVO memberLogin(MemberVO mv);
	
	public int memberPwfind(MemberVO mv);

	public List<MemberVO> searchMemberList(MemberVO mv);
	
	public int MemberUpdate(MemberVO mv);
	
	public int MemberDelete(String memEm);

	public List<MemberVO> getAllMemList();
}
