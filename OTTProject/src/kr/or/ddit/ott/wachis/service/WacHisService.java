package kr.or.ddit.ott.wachis.service;

import java.util.List;

import kr.or.ddit.ott.wachis.dao.WacHisDAO;
import kr.or.ddit.ott.wachis.vo.WacHisVO;
import kr.or.ddit.ott.wislist.vo.WisListVO;

public class WacHisService implements IWacHisService{

	private static IWacHisService wachisService;
	
	private WacHisDAO wachisDAO;
	
	private WacHisService() {
		wachisDAO = WacHisDAO.getInstance();
	}
	
	public static IWacHisService getInstance() {
		if(wachisService == null) {
			wachisService = new WacHisService();
		}
		return wachisService;
	}

	@Override
	public int registerWacHis(WacHisVO vo) {
		int cnt = wachisDAO.insert(vo);
		return cnt;
	}

	@Override
	public List<WacHisVO> WacHisList(String memEm) {
		List<WacHisVO> wachisList = wachisDAO.WacHisList(memEm);
		return wachisList;
	}

	@Override
	public int removeWacHis(String wachisNum) {
		int cnt = wachisDAO.delete(wachisNum);
		return cnt;
	}

	@Override
	public WacHisVO getWacHis(String wachisNum) {
		WacHisVO vo = wachisDAO.getWacHis(wachisNum);
		return vo;
	}

	@Override
	public int listcheck(WacHisVO vo) {
		int cnt = wachisDAO.listCheck(vo);
		return cnt;
	}
}
