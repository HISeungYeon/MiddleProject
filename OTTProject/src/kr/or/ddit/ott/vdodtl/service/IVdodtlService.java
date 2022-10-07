package kr.or.ddit.ott.vdodtl.service;

import java.util.List;

import kr.or.ddit.ott.vdodtl.vo.SearchVO;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;


public interface IVdodtlService {
	public int registerVdodtl(VdodtlVO vo);
	
	public boolean checkVdodtl(String vdodtlNum);
	
	public VdodtlVO getVdodtl(String vdodtlNum);
	
	public int updateVdodtl(VdodtlVO vo);
	
	public int removeVdodtl(String vdodtlNum);
	
	public List<VdodtlVO> getAllVdodtlList();
	
	public List<VdodtlVO> searchVdodtlList(SearchVO sv);
	
	public int incLike (String vdodtlNum);
	
	public List<VdodtlVO> rankList();
}
