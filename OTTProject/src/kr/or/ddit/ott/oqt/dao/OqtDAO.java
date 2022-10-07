package kr.or.ddit.ott.oqt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.mem.vo.MemberVO;
import util.MyBatisUtil;

public class OqtDAO {

	private static OqtDAO instance = new OqtDAO();
	private SqlSession sqlSession;

	public static OqtDAO getInstance() {
		return instance;
	}

	public OqtDAO() {
		sqlSession = MyBatisUtil.getInstance(true);
	}

	// 회원가입
	public int membership(MemberVO mv) {
		int cnt = sqlSession.insert("member.membershipMember", mv);

		return cnt;
	}

	// 로그인
	public int login(MemberVO mv) {

		int cnt = sqlSession.selectOne("member.loginMember", mv);

		return cnt;
	}

	// 비밀번호찾기
	public int findPw(MemberVO mv) {

		int cnt = sqlSession.selectOne("member.findPwMember", mv);

		return cnt;
	}

	// 마이페이지 본인정보 수정
	public int MyPageMember(MemberVO mv) {

		int cnt = sqlSession.update("member.updateMember", mv);

		return cnt;
	}

	// 회원 탈퇴
	public int deleteMember(String memId) {

		int cnt = sqlSession.delete("member.deleteMember", memId);

		return cnt;
	}

	// 마이페이지 본인정보 확인
	public List<MemberVO> MypageList() {

		List<MemberVO> memList = sqlSession.selectList("member.MypageList");

		return memList;
	}
	
	

}
