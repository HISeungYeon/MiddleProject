package kr.or.ddit.ott.rep.service;

import java.util.List;

import kr.or.ddit.ott.rep.dao.IRepDAO;
import kr.or.ddit.ott.rep.dao.RepDAO;
import kr.or.ddit.ott.rep.vo.RepVO;

public class RepService implements IRepService{

	private static IRepService repService;
	
	private IRepDAO repDao;
	
	private RepService() {
		repDao = RepDAO.getInstance();
	}
	
	public static IRepService getInstance() {
		if(repService == null) {
			repService = new RepService();
		}
		return repService;
	}

	@Override
	public int registerRep(RepVO rv) {
		int cnt = repDao.insertRep(rv);
		return cnt;
	}

	@Override
	public int modifyRep(RepVO rv) {
		int cnt = repDao.updateRep(rv);
		return cnt;
	}

	@Override
	public int removeRep(String repNum) {
		int cnt = repDao.deleteRep(repNum);
		return cnt;
	}

	@Override
	public RepVO getRep(String repNum) {
		RepVO rv = repDao.getReb(repNum);
		return rv;
	}

	@Override
	public boolean checkRep(String repNum) {
		boolean chk = repDao.checkReb(repNum);
		return chk;
	}

	@Override
	public List<RepVO> getAllRepList(RepVO rv) {
		List<RepVO> repList = repDao.getAllRepList(rv);
		return repList;
	}
}
