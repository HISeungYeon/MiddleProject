package kr.or.ddit.ott.lkhis.service;

import java.util.List;

import kr.or.ddit.ott.lkhis.vo.LkhisVO;


public interface ILkhisService {

	public int addLkhis(LkhisVO vo);
	
	public List<LkhisVO> searchLkhis(String memEm);

	public int delLkhis(LkhisVO vo);
	
	public int listCheck(LkhisVO vo);

	public int removeLkhis(String lkhisNum);

	public LkhisVO getLkhis(String lkhisNum);
	


}
