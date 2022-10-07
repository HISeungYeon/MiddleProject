package kr.or.ddit.ott.rep.dao;

import java.util.List;

import kr.or.ddit.ott.rep.vo.RepVO;

public interface IRepDAO {
	
	public int insertRep(RepVO rv); //답글 등록
	
	public int updateRep(RepVO rv); //답글 수정
	
	public int deleteRep(String repNum); //답글 삭제
	
	public RepVO getReb(String repNum); //답글 가져오기
	
	public boolean checkReb(String repNum); // 답글 있나없나
	
	public List<RepVO> getAllRepList(RepVO rv); // 모든 댓글 리스트 가져오기
	
	

}
