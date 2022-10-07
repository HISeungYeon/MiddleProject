package kr.or.ddit.ott.ntc.vo;

import java.sql.Date;

public class NtcVO {
	private String ntcNum;
	private String memNum;
	private String ntcTit;
	private String ntcCon;
	private Date ntcDate;
	
	public NtcVO() {}

	public NtcVO(String ntcNum, String memNum, String ntcTit, String ntcCon, Date ntcDate) {
		super();
		this.ntcNum = ntcNum;
		this.memNum = memNum;
		this.ntcTit = ntcTit;
		this.ntcCon = ntcCon;
		this.ntcDate = ntcDate;
	}

	public String getNtcNum() {
		return ntcNum;
	}

	public void setNtcNum(String ntcNum) {
		this.ntcNum = ntcNum;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getNtcTit() {
		return ntcTit;
	}

	public void setNtcTit(String ntcTit) {
		this.ntcTit = ntcTit;
	}

	public String getNtcCon() {
		return ntcCon;
	}

	public void setNtcCon(String ntcCon) {
		this.ntcCon = ntcCon;
	}

	public Date getNtcDate() {
		return ntcDate;
	}

	public void setNtcDate(Date ntcDate) {
		this.ntcDate = ntcDate;
	}

	@Override
	public String toString() {
		return "NtcVO [ntcNum=" + ntcNum + ", memNum=" + memNum + ", ntcTit=" + ntcTit + ", ntcCon=" + ntcCon
				+ ", ntcDate=" + ntcDate + "]";
	}

}
