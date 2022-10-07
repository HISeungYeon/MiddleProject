package kr.or.ddit.ott.oob.dao;

import java.util.List;

import kr.or.ddit.ott.oob.vo.OobVO;

public interface IOobDAO {

	public int insertOob(OobVO ov); //문의글 등록
	
	public int updateOob(OobVO ov); //문의글 수정
	
	public int deleteOob(String oobNum); // 문의글 삭제
	
	public OobVO getOob(String oobNum); //해당하는 문의글 가져오기
	
	public boolean checkOob(String oobNum); //문의글이 있나요?
	
	public List<OobVO> getMemOobList(String memNum);
	
	public List<OobVO> getAllOobList(); // 테이블에 존재하는 모든 문의글 정보 가져오기
	
	public int getRepSit(String oobNum); //답글 상태 가져오기
	
	public List<OobVO> searchOobList(OobVO ov); //검색할 문의글 정보를 담은 ,,,
	
	
}
