package kr.or.ddit.ott.wislist.service;

import java.util.List;

import kr.or.ddit.ott.ntc.dao.NtcDAO;
import kr.or.ddit.ott.ntc.service.INtcService;
import kr.or.ddit.ott.ntc.service.NtcService;
import kr.or.ddit.ott.ntc.vo.NtcVO;
import kr.or.ddit.ott.wislist.dao.WisListDAO;
import kr.or.ddit.ott.wislist.vo.WisListVO;

public class WisListService implements IWisListService {
	
private static IWisListService wisListService;
	
	private WisListDAO wisListDAO;
	
	private WisListService() {
		wisListDAO = WisListDAO.getInstance();
	}
	
	public static IWisListService getInstance() {
		if(wisListService == null) {
			wisListService = new WisListService();
		}
		return wisListService;
	}

	@Override
	public int addWisList(WisListVO vo) {
		int cnt = wisListDAO.insert(vo);
		return cnt;
	}

	@Override
	public List<WisListVO> searchWisList(String memEm) {
		List<WisListVO> wisList = wisListDAO.searchWisList(memEm);
		return wisList;
	}

	@Override
	public int delWisList(WisListVO vo) {
		int cnt = wisListDAO.delete(vo);
		return cnt;
	}

	@Override
	public int listCheck(WisListVO vo) {
		int cnt = wisListDAO.listCheck(vo);
		return cnt;
	}

	@Override
	public int removeWisList(String wislistNum) {
		int cnt = wisListDAO.removeWisList(wislistNum);
		return cnt;
	}

	@Override
	public WisListVO getWisList(String wislistNum) {
		WisListVO vo = wisListDAO.getWisList(wislistNum);
		return vo;
	}
	

	


	
}

