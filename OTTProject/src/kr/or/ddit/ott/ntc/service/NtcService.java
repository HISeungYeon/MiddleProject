package kr.or.ddit.ott.ntc.service;

import java.util.List;

import kr.or.ddit.ott.ntc.dao.NtcDAO;
import kr.or.ddit.ott.ntc.vo.NtcVO;

public class NtcService implements INtcService {

	private static INtcService ntcService;
	
	private NtcDAO ntcDAO;
	
	private NtcService() {
		ntcDAO = NtcDAO.getInstance();
	}
	
	public static INtcService getInstance() {
		if(ntcService == null) {
			ntcService = new NtcService();
		}
		return ntcService;
	}
	

	@Override
	public int registerNtc(NtcVO vo) {
		int cnt = ntcDAO.insert(vo);
		return cnt;
	}

	@Override
	public NtcVO getNtc(String ntcNum) {
		NtcVO vo = ntcDAO.getNtc(ntcNum);
		return vo;
	}

	@Override
	public int updateNtc(NtcVO vo) {
		int cnt = ntcDAO.update(vo);
		return cnt;
	}

	@Override
	public int removeNtc(String ntcNum) {
		int cnt = ntcDAO.delete(ntcNum);
		return cnt;
	}

	@Override
	public List<NtcVO> searchNtcList(NtcVO vo) {
		List<NtcVO> ntcList = ntcDAO.searchNtcList(vo);
		return ntcList;
	}

	@Override
	public List<NtcVO> getAllNtcList() {
		
		List<NtcVO> ntcList = ntcDAO.getAllNtcList();
		return ntcList;
	}

	@Override
	public boolean checkNtc(String ntcNum) {
		boolean chk = ntcDAO.checkNtc(ntcNum);
		return chk;
	}
}
