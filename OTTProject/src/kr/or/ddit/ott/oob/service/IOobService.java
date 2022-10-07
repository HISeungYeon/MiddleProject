package kr.or.ddit.ott.oob.service;

import java.util.List;

import kr.or.ddit.ott.oob.vo.OobVO;

public interface IOobService {

	public int registerOob(OobVO ov);
	
	public int modifyOob(OobVO ov);
	
	public int removeOob(String oobNum);
	
	public OobVO getOob (String oobNum);
	
	public boolean checkOob(String oobNum);
	
	public List<OobVO> getMemOobList(String memNum);
	
	public List<OobVO> getAllOobList(); 
	
	public int getRepSit(String oobNum);
	
	public List<OobVO> searchOobList(OobVO ov);

}
