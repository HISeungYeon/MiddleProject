package kr.or.ddit.ott.ntc.service;

import java.util.List;

import kr.or.ddit.ott.ntc.vo.NtcVO;

public interface INtcService {
	public int registerNtc(NtcVO vo);
	
	public boolean checkNtc(String ntcNum);
	
	public NtcVO getNtc(String ntcNum);
	
	public int updateNtc(NtcVO vo);
	
	public int removeNtc(String ntcNum);
	
	public List<NtcVO> getAllNtcList();
	
	public List<NtcVO> searchNtcList(NtcVO vo);
}
