package kr.or.ddit.ott.wislist.dao;

import java.util.List;

import kr.or.ddit.ott.wislist.vo.WisListVO;

public interface IWisListDAO {
	public int insert(WisListVO vo);
	
	public List<WisListVO> searchWisList(String memEm);

	public int delete(WisListVO vo);
	
	public int listCheck(WisListVO vo);
	
	public int removeWisList(String wislistNum);
	
	public WisListVO getWisList(String wislistNum);
}
