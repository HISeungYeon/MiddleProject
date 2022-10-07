package kr.or.ddit.ott.vdoty.service;

import java.util.List;

import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.vdoty.vo.VdoTyVO;

public interface IVdoTyService {

	public List<VdoTyVO> searchVdoTyList(VdoTyVO vv);

}
