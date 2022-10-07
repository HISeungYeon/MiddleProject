package kr.or.ddit.ott.lkhis.service;

import java.util.List;

import kr.or.ddit.ott.lkhis.dao.LkhisDAO;
import kr.or.ddit.ott.lkhis.vo.LkhisVO;

public class LkhisService implements ILkhisService {
	
private static ILkhisService lkhisService;
	
	private LkhisDAO lkhisDAO;
	
	private LkhisService() {
		lkhisDAO = LkhisDAO.getInstance();
	}
	
	public static ILkhisService getInstance() {
		if(lkhisService == null) {
			lkhisService = new LkhisService();
		}
		return lkhisService;
	}

	@Override
	public int addLkhis(LkhisVO vo) {
		int cnt = lkhisDAO.insert(vo);
		return cnt;
	}

	@Override
	public List<LkhisVO> searchLkhis(String memEm) {
		List<LkhisVO> lkhisList = lkhisDAO.searchLkhis(memEm);
		return lkhisList;
	}

	@Override
	public int delLkhis(LkhisVO vo) {
		int cnt = lkhisDAO.delete(vo);
		return cnt;
	}

	@Override
	public int listCheck(LkhisVO vo) {
		int cnt = lkhisDAO.listCheck(vo);
		return cnt;
	}

	@Override
	public int removeLkhis(String lkhisNum) {
		int cnt = lkhisDAO.removeLkhis(lkhisNum);
		return cnt;
	}

	@Override
	public LkhisVO getLkhis(String lkhisNum) {
		LkhisVO vo = lkhisDAO.getLkhis(lkhisNum);
		return vo;
	}

	

	


	
}

