package kr.or.ddit.ott.oob.service;

import java.util.List;

import kr.or.ddit.ott.oob.dao.IOobDAO;
import kr.or.ddit.ott.oob.dao.OobDAO;
import kr.or.ddit.ott.oob.vo.OobVO;

public class OobService implements IOobService {

	private static IOobService oobService;
	
	private IOobDAO oobDao;
	
	private OobService() {
		oobDao = OobDAO.getInstance();
	}
	
	public static IOobService getInstance() {
		if(oobService == null) {
			oobService = new OobService();
		}
		return oobService;
	}
	
	
	@Override
	public int registerOob(OobVO ov) {
		int cnt = oobDao.insertOob(ov);
		return cnt;
	}

	@Override
	public int modifyOob(OobVO ov) {
		int cnt = oobDao.updateOob(ov);
		return cnt;
	}

	@Override
	public int removeOob(String oobNum) {
		int cnt = oobDao.deleteOob(oobNum);
		return cnt;
	}

	@Override
	public OobVO getOob(String oobNum) {
		OobVO ov = oobDao.getOob(oobNum);
		return ov;
	}

	@Override
	public boolean checkOob(String oobNum) {
		boolean chk = oobDao.checkOob(oobNum);
		return chk;
	}

	@Override
	public List<OobVO> getAllOobList() {
		List<OobVO> oobList = oobDao.getAllOobList();
		return oobList;
	}

	@Override
	public List<OobVO> getMemOobList(String memNum) {
		List<OobVO> oobList = oobDao.getMemOobList(memNum);
		return oobList;
	}
	
	@Override
	public List<OobVO> searchOobList(OobVO ov) {
		List<OobVO> oobList = oobDao.searchOobList(ov);
		return oobList;
	}

	@Override
	public int getRepSit(String oobNum) {
		int cnt = oobDao.getRepSit(oobNum);
		return cnt;
	}


}
