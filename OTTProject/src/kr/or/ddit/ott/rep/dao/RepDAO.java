package kr.or.ddit.ott.rep.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.rep.vo.RepVO;
import util.MyBatisUtil;

public class RepDAO implements IRepDAO {

	private static RepDAO instance = new RepDAO();

	private SqlSession sqlSession;

	public static RepDAO getInstance() {
		return instance;
	}

	public RepDAO() {
		sqlSession = MyBatisUtil.getInstance(true);
	}

	@Override
	public int insertRep(RepVO rv) {
		int cnt = sqlSession.insert("rep.insertRep", rv);
		return cnt;
	}

	@Override
	public int updateRep(RepVO rv) {
		int cnt = sqlSession.update("rep.updateRep", rv);
		return cnt;
	}

	@Override
	public int deleteRep(String repNum) {
		int cnt = sqlSession.delete("rep.deleteRep", repNum);
		return cnt;
	}

	@Override
	public RepVO getReb(String repNum) {
		RepVO repVO = sqlSession.selectOne("rep.getRep", repNum);
		return repVO;
	}

	@Override
	public boolean checkReb(String repNum) {
		boolean chk = false;

		int cnt = sqlSession.selectOne("rep.getRep", repNum);

		if (cnt > 0) {
			chk = true;
		}

		return chk;
	}

	@Override
	public List<RepVO> getAllRepList(RepVO rv) {
		List<RepVO> repList = sqlSession.selectList("rep.allRepList", rv);
		return repList;
	}

}
