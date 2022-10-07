package kr.or.ddit.ott.wislist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.wislist.vo.WisListVO;
import util.MyBatisUtil;

public class WisListDAO implements IWisListDAO {

	private static WisListDAO instance = new WisListDAO();
	private SqlSession sqlSession;

	public static WisListDAO getInstance() {
		return instance;
	}
    public WisListDAO() { 
       sqlSession = MyBatisUtil.getInstance(true);
    }
	
	public int insert(WisListVO vo) {
		int cnt = sqlSession.insert("wislist.insert", vo);
		return cnt;
	}
	
	public List<WisListVO> searchWisList(String memEm) {
		List<WisListVO> wisList = sqlSession.selectList("wislist.searchWisList",memEm);
		return wisList;
	}
	
	public int delete(WisListVO vo) {
		int cnt = sqlSession.delete("wislist.delete",vo);
		return cnt;
	}
	public int listCheck(WisListVO vo) {
		int cnt = sqlSession.selectOne("wislist.listCheck",vo);
		return cnt;
	}

	@Override
	public int removeWisList(String wislistNum) {
		int cnt = sqlSession.delete("wislist.remove",wislistNum);
		return cnt;
	}
	@Override
	public WisListVO getWisList(String wislistNum) {
		WisListVO vo = sqlSession.selectOne("wislist.selectOne", wislistNum);
		return vo;
	}
	

}
