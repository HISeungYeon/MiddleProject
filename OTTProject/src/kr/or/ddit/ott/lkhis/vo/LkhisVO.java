package kr.or.ddit.ott.lkhis.vo;

import java.sql.Date;

public class LkhisVO {
	
	private String lkhisNum;
	private String memNum;
	private String vdodtlNum;
	private Date lkhisDown;
	private String streFileNm;
	private String vdodtlNm;
	private String memEm;
	
	public LkhisVO() {}

	public LkhisVO(String memNum, String vdodtlNum) {
		super();
		this.memNum = memNum;
		this.vdodtlNum = vdodtlNum;
	}


	public LkhisVO(String lkhisNum, String memNum, String vdodtlNum, Date lkhisDown, String streFileNm, String vdodtlNm,
			String memEm) {
		super();
		this.lkhisNum = lkhisNum;
		this.memNum = memNum;
		this.vdodtlNum = vdodtlNum;
		this.lkhisDown = lkhisDown;
		this.streFileNm = streFileNm;
		this.vdodtlNm = vdodtlNm;
		this.memEm = memEm;
	}

	public String getLkhisNum() {
		return lkhisNum;
	}

	public void setLkhisNum(String lkhisNum) {
		this.lkhisNum = lkhisNum;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getVdodtlNum() {
		return vdodtlNum;
	}

	public void setVdodtlNum(String vdodtlNum) {
		this.vdodtlNum = vdodtlNum;
	}

	public Date getLkhisDown() {
		return lkhisDown;
	}

	public void setLkhisDown(Date lkhisDown) {
		this.lkhisDown = lkhisDown;
	}

	public String getStreFileNm() {
		return streFileNm;
	}

	public void setStreFileNm(String streFileNm) {
		this.streFileNm = streFileNm;
	}

	public String getVdodtlNm() {
		return vdodtlNm;
	}

	public void setVdodtlNm(String vdodtlNm) {
		this.vdodtlNm = vdodtlNm;
	}

	public String getMemEm() {
		return memEm;
	}

	public void setMemEm(String memEm) {
		this.memEm = memEm;
	}

	@Override
	public String toString() {
		return "LkhisVO [lkhisNum=" + lkhisNum + ", memNum=" + memNum + ", vdodtlNum=" + vdodtlNum + ", lkhisDown="
				+ lkhisDown + ", streFileNm=" + streFileNm + ", vdodtlNm=" + vdodtlNm + ", memEm=" + memEm + "]";
	}

	
	


	
}
