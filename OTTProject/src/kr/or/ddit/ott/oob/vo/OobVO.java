package kr.or.ddit.ott.oob.vo;

import java.sql.Date;

public class OobVO {
	private String oobNum;
	private String memNum;
	private String oobTit;
	private String oobCon;
	private Date oobDate;
	
	
	public OobVO() {
		super();
	}

	public OobVO(String oobNum, String memNum, String oobTit, String oobCon, Date oobDate) {
		super();
		this.oobNum = oobNum;
		this.memNum = memNum;
		this.oobTit = oobTit;
		this.oobCon = oobCon;
		this.oobDate = oobDate;
	}

	public String getOobNum() {
		return oobNum;
	}

	public void setOobNum(String oobNum) {
		this.oobNum = oobNum;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getOobTit() {
		return oobTit;
	}

	public void setOobTit(String oobTit) {
		this.oobTit = oobTit;
	}

	public String getOobCon() {
		return oobCon;
	}

	public void setOobCon(String oobCon) {
		this.oobCon = oobCon;
	}

	public Date getOobDate() {
		return oobDate;
	}

	public void setOobDate(Date oobDate) {
		this.oobDate = oobDate;
	}

	@Override
	public String toString() {
		return "OobVO [oobNum=" + oobNum + ", memNum=" + memNum + ", oobTit=" + oobTit + ", oobCon=" + oobCon
				+ ", oobDate=" + oobDate + "]";
	}
	
	

}
