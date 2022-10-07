package kr.or.ddit.ott.rep.service;

import java.util.List;

import kr.or.ddit.ott.rep.vo.RepVO;

public interface IRepService {
	
	public int registerRep(RepVO rv);
	
	public int modifyRep(RepVO rv);
	
	public int removeRep(String repNum);
	
	public RepVO getRep (String repNum);
	
	public boolean checkRep(String repNum);
	
	public List<RepVO> getAllRepList(RepVO rv);

}
