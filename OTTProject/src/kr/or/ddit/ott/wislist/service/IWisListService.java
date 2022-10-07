package kr.or.ddit.ott.wislist.service;

import java.util.List;

import kr.or.ddit.ott.wislist.vo.WisListVO;

public interface IWisListService {

	public int addWisList(WisListVO vo);
	
	public List<WisListVO> searchWisList(String memEm);

	public int delWisList(WisListVO vo);
	
	public int listCheck(WisListVO vo);

	public int removeWisList(String wislistNum);

	public WisListVO getWisList(String wislistNum);
	
}
