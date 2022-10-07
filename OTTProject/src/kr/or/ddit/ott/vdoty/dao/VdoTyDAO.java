package kr.or.ddit.ott.vdoty.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.mem.service.MemberService;
import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;
import kr.or.ddit.ott.vdoty.vo.VdoTyVO;
import util.MyBatisUtil;

public class VdoTyDAO implements IVdoTyDAO {

	private static IVdoTyDAO vtyDao;
	
	private SqlSession sqlSession;

	public VdoTyDAO() {
		sqlSession = MyBatisUtil.getInstance(true);
	}
	
	public static IVdoTyDAO getInstance() {
		if (vtyDao == null) {
			vtyDao = new VdoTyDAO();
		}
		
		return vtyDao;
	}

	// 장르별 영상물 확인
	public List<VdoTyVO> VdoTyList(VdoTyVO vv) {

		List<VdoTyVO> VdoTyList = sqlSession.selectList("vdoty.VdoTyList", vv);

		return VdoTyList;
	}


}
