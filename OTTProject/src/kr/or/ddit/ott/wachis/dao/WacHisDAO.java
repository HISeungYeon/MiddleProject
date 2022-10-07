package kr.or.ddit.ott.wachis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.ntc.vo.NtcVO;
import kr.or.ddit.ott.wachis.vo.WacHisVO;
import kr.or.ddit.ott.wislist.vo.WisListVO;
import util.MyBatisUtil;

public class WacHisDAO {

	private static WacHisDAO instance = new WacHisDAO();
	private SqlSession sqlSession;

	public static WacHisDAO getInstance() {
		return instance;
	}

	public WacHisDAO() {
		sqlSession = MyBatisUtil.getInstance(true);
	}

	public int insert(WacHisVO vo) {
		int cnt = sqlSession.insert("wachis.insert", vo);
		return cnt;
	}

	// 전체 시청 내역
	public List<WacHisVO> WacHisList(String memEm) {
		List<WacHisVO> wachisList = sqlSession.selectList("wachis.wachisList",memEm);
		return wachisList;
	}
	// 시청 내역 삭제
	public int delete(String wachisNum) {
		int cnt = sqlSession.delete("wachis.delete",wachisNum);
		return cnt;
	}
	
	public WacHisVO getWacHis(String wachisNum) {
		WacHisVO vo = sqlSession.selectOne("wachis.selectOne", wachisNum);
		return vo;
	}
	public int listCheck(WacHisVO vo) {
		int cnt = sqlSession.selectOne("wachis.listCheck",vo);
		return cnt;
	}

}
