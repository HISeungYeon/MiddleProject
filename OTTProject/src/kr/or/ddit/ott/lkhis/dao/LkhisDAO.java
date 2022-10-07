package kr.or.ddit.ott.lkhis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.lkhis.vo.LkhisVO;
import kr.or.ddit.ott.wislist.vo.WisListVO;
import util.MyBatisUtil;

public class LkhisDAO implements ILkhisDAO{

	private static LkhisDAO instance = new LkhisDAO();
	private SqlSession sqlSession;

	public static LkhisDAO getInstance() {
		return instance;
	}
    public LkhisDAO() { 
       sqlSession = MyBatisUtil.getInstance(true);
    }
	@Override
	public int insert(LkhisVO vo) {
		int cnt = sqlSession.insert("lkhis.insert", vo);
		return cnt;
	}
	@Override
	public List<LkhisVO> searchLkhis(String memEm) {
		List<LkhisVO> lkhisList = sqlSession.selectList("lkhis.searchLkhisList",memEm);
		return lkhisList;
	}
	@Override
	public int delete(LkhisVO vo) {
		int cnt = sqlSession.delete("lkhis.delete",vo);
		return cnt;
	}
	@Override
	public int listCheck(LkhisVO vo) {
		int cnt = sqlSession.selectOne("lkhis.listCheck",vo);
		return cnt;
	}
	@Override
	public int removeLkhis(String lkhisNum) {
		int cnt = sqlSession.delete("lkhis.remove",lkhisNum);
		return cnt;
	}
	@Override
	public LkhisVO getLkhis(String lkhisNum) {
		LkhisVO vo = sqlSession.selectOne("lkhis.selectOne", lkhisNum);
		return vo;
	}
	


}
