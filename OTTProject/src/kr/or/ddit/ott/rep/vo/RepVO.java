package kr.or.ddit.ott.rep.vo;

import java.sql.Date;

public class RepVO {
	private String repNum;
	private String oobNum;
	private String repCon;
	private Date repDate;
	private String repSit = "답변 대기";
	
	public RepVO() {
		
	}

	public RepVO(String repNum, String oobNum, String repCon, Date repDate, String repSit) {
		super();
		this.repNum = repNum;
		this.oobNum = oobNum;
		this.repCon = repCon;
		this.repDate = repDate;
		this.repSit = repSit;
	}

	public String getRepNum() {
		return repNum;
	}

	public void setRepNum(String repNum) {
		this.repNum = repNum;
	}

	public String getOobNum() {
		return oobNum;
	}

	public void setOobNum(String oobNum) {
		this.oobNum = oobNum;
	}

	public String getRepCon() {
		return repCon;
	}

	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	public String getRepSit() {
		return repSit;
	}

	public void setRepSit(String repSit) {
		this.repSit = repSit;
	}

	@Override
	public String toString() {
		return "RepVO [repNum=" + repNum + ", oobNum=" + oobNum + ", repCon=" + repCon + ", repDate=" + repDate
				+ ", repSit=" + repSit + "]";
	}
	
	
	

}
