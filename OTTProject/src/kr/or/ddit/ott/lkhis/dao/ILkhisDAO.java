package kr.or.ddit.ott.lkhis.dao;

import java.util.List;

import kr.or.ddit.ott.lkhis.vo.LkhisVO;
import kr.or.ddit.ott.wislist.vo.WisListVO;

public interface ILkhisDAO {
	public int insert(LkhisVO vo);
	
	public List<LkhisVO> searchLkhis(String memEm);

	public int delete(LkhisVO vo);
	
	public int listCheck(LkhisVO vo);
	
	public int removeLkhis(String lkhisNum);
	
	public LkhisVO getLkhis(String lkhisNum);
	
}
