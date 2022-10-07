package kr.or.ddit.ott.wachis.service;

import java.util.List;

import kr.or.ddit.ott.wachis.vo.WacHisVO;
import kr.or.ddit.ott.wislist.vo.WisListVO;

public interface IWacHisService {
	public int registerWacHis(WacHisVO vo);
	
	public List<WacHisVO> WacHisList(String memEm);
	
	public int removeWacHis(String wachisNum);
	
	public WacHisVO getWacHis(String wachisNum);
	
	public int listcheck(WacHisVO vo);
}
