package kr.or.ddit.ott.vdodtl.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.vdodtl.vo.SearchVO;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;
import util.MyBatisUtil;

public class VdodtlDAO {

	private static VdodtlDAO instance = new VdodtlDAO();
	private SqlSession sqlSession;

	public static VdodtlDAO getInstance() {
		return instance;
	}

	public VdodtlDAO() {
		sqlSession = MyBatisUtil.getInstance(true);
	}

	// 영상물 삽입
	public int insert(VdodtlVO vo) {
		int cnt = sqlSession.insert("vdodtl.insert", vo);
		return cnt;
	}

	// 영상물 확인
	public boolean checkVdodtl(String vdodtlNum) {
		boolean chk = false;
		int cnt = sqlSession.selectOne("vdodtl.checkVdodtl", vdodtlNum);
		if(cnt > 0) {
			chk = true;
		}
		return chk;
	}

	// 영상물  한개의 정보 가져오기
	public VdodtlVO getVdodtl(String vdodtlNum) {
		VdodtlVO vdodtlVO = sqlSession.selectOne("vdodtl.selectOne", vdodtlNum);
		return vdodtlVO;
	}

	// 영상물 수정(내용)
	public int update(VdodtlVO vo) {
		int cnt = sqlSession.update("vdodtl.update", vo);
		return cnt;
	}

	// 영상물 삭제
	public int delete(String vdodtlNum) {
		int cnt = sqlSession.delete("vdodtl.delete", vdodtlNum);
		return cnt;
	}

	// 영상물 전체 목록
	public List<VdodtlVO> getAllVdodtlList() {
		List<VdodtlVO> vdodtlList = sqlSession.selectList("vdodtl.getAllVdodtlList");
		return vdodtlList;
	}

	// 영상물 검색
	public List<VdodtlVO> searchVdodtlList(SearchVO sv) {
		List<VdodtlVO> vdodtlList = sqlSession.selectList("vdodtl.searchVdodtl", sv);
		return vdodtlList;
	}
	
	// 좋아요수 증가
	public int incLike(String vdodtlNum) {
		int cnt = sqlSession.update("vdodtl.incLike",vdodtlNum);
		return cnt;
	}
	
	// 좋아요순서 정렬
	public List<VdodtlVO> rankList(){
		List<VdodtlVO> rankList = sqlSession.selectList("vdodtl.likeRank");
		return rankList;
	}
}
