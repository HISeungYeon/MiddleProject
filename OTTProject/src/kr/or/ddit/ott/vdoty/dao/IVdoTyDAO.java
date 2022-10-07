package kr.or.ddit.ott.vdoty.dao;

import java.util.List;

import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.vdodtl.vo.VdodtlVO;
import kr.or.ddit.ott.vdoty.vo.VdoTyVO;

public interface IVdoTyDAO {

	public List<VdoTyVO> VdoTyList(VdoTyVO vv);
	
}
