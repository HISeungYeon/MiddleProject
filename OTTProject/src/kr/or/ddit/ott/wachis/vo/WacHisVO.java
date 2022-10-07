package kr.or.ddit.ott.wachis.vo;

import java.sql.Date;

public class WacHisVO {
	private String wachisNum;
	private String memNum;
	private String vdodtlNum;
	private Date wachisDtus;
	private String streFileNm;
	private String vdodtlNm;
	private String memEm;

	public WacHisVO() {}

	public WacHisVO(String wachisNum, String memNum, String vdodtlNum, Date wachisDtus, String streFileNm,
			String vdodtlNm, String memEm) {
		super();
		this.wachisNum = wachisNum;
		this.memNum = memNum;
		this.vdodtlNum = vdodtlNum;
		this.wachisDtus = wachisDtus;
		this.streFileNm = streFileNm;
		this.vdodtlNm = vdodtlNm;
		this.memEm = memEm;
	}

	public String getWachisNum() {
		return wachisNum;
	}

	public void setWachisNum(String wachisNum) {
		this.wachisNum = wachisNum;
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

	public Date getWachisDtus() {
		return wachisDtus;
	}

	public void setWachisDtus(Date wachisDtus) {
		this.wachisDtus = wachisDtus;
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
		return "WacHisVO [wachisNum=" + wachisNum + ", memNum=" + memNum + ", vdodtlNum=" + vdodtlNum + ", wachisDtus="
				+ wachisDtus + ", streFileNm=" + streFileNm + ", vdodtlNm=" + vdodtlNm + ", memEm=" + memEm + "]";
	}

	

	
	
}
