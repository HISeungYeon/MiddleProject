package kr.or.ddit.ott.oqt.vo;

import java.sql.Date;

public class OqtVO {
	private String oqtTit;
	private String oqtCon;
	private Date oqtDate;
	
	public OqtVO() {}

	public OqtVO(String oqtTit, String oqtCon, Date oqtDate) {
		super();
		this.oqtTit = oqtTit;
		this.oqtCon = oqtCon;
		this.oqtDate = oqtDate;
	}

	public String getOqtTit() {
		return oqtTit;
	}

	public void setOqtTit(String oqtTit) {
		this.oqtTit = oqtTit;
	}

	public String getOqtCon() {
		return oqtCon;
	}

	public void setOqtCon(String oqtCon) {
		this.oqtCon = oqtCon;
	}

	public Date getOqtDate() {
		return oqtDate;
	}

	public void setOqtDate(Date oqtDate) {
		this.oqtDate = oqtDate;
	}

	@Override
	public String toString() {
		return "OqtVO [oqtTit=" + oqtTit + ", oqtCon=" + oqtCon + ", oqtDate=" + oqtDate + "]";
	}

}
