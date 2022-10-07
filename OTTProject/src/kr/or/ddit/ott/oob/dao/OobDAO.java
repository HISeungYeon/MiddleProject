package kr.or.ddit.ott.oob.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.ott.oob.vo.OobVO;
import util.MyBatisUtil;

public class OobDAO implements IOobDAO{

   private static OobDAO instance = new OobDAO(); //싱글톤
   
   private SqlSession sqlSession;

   public static OobDAO getInstance() { //싱글톤
      return instance;
   }

   public OobDAO() { //오토커밋 
      sqlSession = MyBatisUtil.getInstance(true);
   }
   
   public int insertMember(OobVO ov) {
      int cnt = sqlSession.insert("");
      return cnt;
   }

 //문의글 추가
@Override 
public int insertOob(OobVO ov) {
	int cnt = sqlSession.insert("oob.insertOob", ov); //?
	return cnt;
}

// 문의글 수정
@Override
public int updateOob(OobVO ov) {
	int cnt = sqlSession.update("oob.updateOob", ov);
	return cnt;
}



// 문의글 삭제
@Override
public int deleteOob(String oobNum) {
	int cnt = sqlSession.delete("oob.deleteOob", oobNum);
	return cnt;
}

// 해당 문의글 불러오기
@Override
public OobVO getOob(String oobNum) {
	OobVO oobVO = sqlSession.selectOne("oob.getOob", oobNum);
	return oobVO;
}

// 해당 문의글 있나없나
@Override
public boolean checkOob(String oobNum) {
	boolean chk = false;
	
	int cnt = sqlSession.selectOne("oob.getOob", oobNum);
	
	if(cnt > 0) {
		chk = true;
	}
	
	return chk;
}

// 문의글 전체 조회
@Override
public List<OobVO> getAllOobList() {
	List<OobVO> oobList = sqlSession.selectList("oob.allOobList");
	return oobList;
}

// 회원 문의글 조회
@Override
public List<OobVO> getMemOobList(String memNum) {
	List<OobVO> oobList = sqlSession.selectList("oob.memOobList", memNum);
	return oobList;
}

//문의글 검색
@Override
public List<OobVO> searchOobList(OobVO ov) {
	List<OobVO> oobList = sqlSession.selectList("oob.searchOobList", ov);
	return oobList;
}

@Override
public int getRepSit(String oobNum) {
	int cnt = sqlSession.selectOne("oob.repSit", oobNum);
	return cnt;
}

}