package kr.or.ddit.ott.ntc.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.ntc.vo.NtcVO;
import util.MyBatisUtil;

public class NtcDAO {
	
	private static NtcDAO instance = new NtcDAO();
	private SqlSession sqlSession;

	public static NtcDAO getInstance() {
		return instance;
	}
	
	public NtcDAO() {
		sqlSession = MyBatisUtil.getInstance(true);
	}
	
	// 공지글 삽입
	public int insert(NtcVO vo) {
		int cnt = sqlSession.insert("ntc.insert", vo);

		return cnt;
	}
	
	// 공지글 한개 조회
	public NtcVO getNtc(String ntcNum){
		NtcVO ntcVO = sqlSession.selectOne("ntc.selectOne", ntcNum);

		return ntcVO;
	}
	// 수정
	public int update(NtcVO vo) {
		int cnt = sqlSession.update("ntc.update", vo);

		return cnt;
	}
	// 공지글 전체 조회
	public List<NtcVO> getAllNtcList() {
		List<NtcVO> ntcList = sqlSession.selectList("ntc.getAllNtcList");
		return ntcList;
	}
	// 삭제
	public int delete(String ntcNum) {
		int cnt = sqlSession.delete("ntc.delete",ntcNum);
		return cnt;
	}
	// 검색
	public List<NtcVO> searchNtcList(NtcVO vo){
		List<NtcVO> ntcList = sqlSession.selectList("ntc.searchNtc",vo);
		return ntcList;
	}
	
	// 체크
	public boolean checkNtc(String ntcNum) {
		boolean chk = false;
		
		int cnt = sqlSession.selectOne("ntc.checkNtc",ntcNum);
		
		if(cnt > 0) {
			chk = true;
		}
		return chk;
	}
	
	// 페이지 체킹
	

}
