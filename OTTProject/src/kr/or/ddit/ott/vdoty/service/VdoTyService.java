package kr.or.ddit.ott.vdoty.service;

import java.util.List;

import kr.or.ddit.ott.mem.dao.IMemberDAO;
import kr.or.ddit.ott.mem.dao.MemberDAO;
import kr.or.ddit.ott.mem.vo.MemberVO;
import kr.or.ddit.ott.vdoty.dao.IVdoTyDAO;
import kr.or.ddit.ott.vdoty.dao.VdoTyDAO;
import kr.or.ddit.ott.vdoty.vo.VdoTyVO;

public class VdoTyService implements IVdoTyService {

	private static IVdoTyService vdoTyService;

	private IVdoTyDAO vtyDAO;

	private VdoTyService() {
		vtyDAO = VdoTyDAO.getInstance();
	}

	public static IVdoTyService getInstance() {
		if (vdoTyService == null) {
			vdoTyService = new VdoTyService();
		}

		return vdoTyService;
	}

	@Override
	public List<VdoTyVO> searchVdoTyList(VdoTyVO vv) {
		
		List<VdoTyVO> VdoTyList = vtyDAO.VdoTyList(vv);
		
		return VdoTyList;
	}

}
