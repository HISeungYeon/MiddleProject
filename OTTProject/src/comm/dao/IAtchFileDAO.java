package comm.dao;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import comm.vo.AtchFileVO;

public interface IAtchFileDAO {

	/**
	 * 첨부파일 저장
	 * 
	 * @param atchFileVO
	 * @return
	 */
	public int insertAtchFile(SqlSession session, AtchFileVO atchFileVO);

	/**
	 * 첨부파일 세부정보 저장
	 * 
	 * @param atchFileVO
	 * @return
	 */
	public int insertAtchFileDetail(SqlSession session, AtchFileVO atchFileVO);

	/**
	 * 첨부파일 목록 조회
	 * 
	 * @param atchFileVO
	 * @return
	 */
	public List<AtchFileVO> getAtchFileList(SqlSession session, AtchFileVO atchFileVO);

	/**
	 * 첨부파일 세부정보 조회
	 * 
	 * @param atchFileVO
	 * @return 첨부파일 세부정보를 담은 AtchFileVO객체
	 */
	public AtchFileVO getAtchFileDetail(SqlSession session, AtchFileVO atchFileVO);

}
