package kr.or.ddit.ott.sub.vo;

import java.sql.Date;

public class SubVO {
	private String subPayNum;
	private String subPay;
	private Date subPurdt;
	private Date subExdt;
	private String subSit;
	private String subNm;
	private String subCancl;
	private String subMthd;

	public SubVO() {}

	public SubVO(String subPayNum, String subPay, Date subPurdt, Date subExdt, String subSit, String subNm,
			String subCancl, String subMthd) {
		super();
		this.subPayNum = subPayNum;
		this.subPay = subPay;
		this.subPurdt = subPurdt;
		this.subExdt = subExdt;
		this.subSit = subSit;
		this.subNm = subNm;
		this.subCancl = subCancl;
		this.subMthd = subMthd;
	}

	public String getSubPayNum() {
		return subPayNum;
	}

	public void setSubPayNum(String subPayNum) {
		this.subPayNum = subPayNum;
	}

	public String getSubPay() {
		return subPay;
	}

	public void setSubPay(String subPay) {
		this.subPay = subPay;
	}

	public Date getSubPurdt() {
		return subPurdt;
	}

	public void setSubPurdt(Date subPurdt) {
		this.subPurdt = subPurdt;
	}

	public Date getSubExdt() {
		return subExdt;
	}

	public void setSubExdt(Date subExdt) {
		this.subExdt = subExdt;
	}

	public String getSubSit() {
		return subSit;
	}

	public void setSubSit(String subSit) {
		this.subSit = subSit;
	}

	public String getSubNm() {
		return subNm;
	}

	public void setSubNm(String subNm) {
		this.subNm = subNm;
	}

	public String getSubCancl() {
		return subCancl;
	}

	public void setSubCancl(String subCancl) {
		this.subCancl = subCancl;
	}

	public String getSubMthd() {
		return subMthd;
	}

	public void setSubMthd(String subMthd) {
		this.subMthd = subMthd;
	}

	@Override
	public String toString() {
		return "SubVO [subPayNum=" + subPayNum + ", subPay=" + subPay + ", subPurdt=" + subPurdt + ", subExdt="
				+ subExdt + ", subSit=" + subSit + ", subNm=" + subNm + ", subCancl=" + subCancl + ", subMthd="
				+ subMthd + "]";
	}

}
