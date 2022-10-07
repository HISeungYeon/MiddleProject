package kr.or.ddit.ott.olrev.vo;

import java.sql.Date;

public class OlRevVO {
	private String olrevCon;
	private Date olrevDate;
	
	public OlRevVO() {}

	public OlRevVO(String olrevCon, Date olrevDate) {
		super();
		this.olrevCon = olrevCon;
		this.olrevDate = olrevDate;
	}

	public String getOlrevCon() {
		return olrevCon;
	}

	public void setOlrevCon(String olrevCon) {
		this.olrevCon = olrevCon;
	}

	public Date getOlrevDate() {
		return olrevDate;
	}

	public void setOlrevDate(Date olrevDate) {
		this.olrevDate = olrevDate;
	}

	@Override
	public String toString() {
		return "OlRevVO [olrevCon=" + olrevCon + ", olrevDate=" + olrevDate + "]";
	}
}
