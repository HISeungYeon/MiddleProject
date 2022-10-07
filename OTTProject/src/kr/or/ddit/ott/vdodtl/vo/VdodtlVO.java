package kr.or.ddit.ott.vdodtl.vo;

import java.sql.Date;

public class VdodtlVO {
	private String vdodtlNum;	// 영상물 번호
	private String vdotyNum;	// 영상물 장르 번호
	private String vdolevNum;  // 관람 등급 번호
	private String vdodtlNm;	// 영상물 명 
	private String vdodtlDtl;	// 영상 상세 정보
	private String vdodtlSumy;	// 영상 요약 정보
	private String vdodtlPlytm;	// 재생시간
	private Date vdodtlRedt;	// 영상 등록일
	private String vdodtlLik;	// 영상 좋아요 수
	private String vdodtlImg;	// 영상 포스터 이미지
	private long atchFileId = -1;
	private String streFileNm;

	public VdodtlVO() {}

	public VdodtlVO(String vdodtlNum, String vdotyNum, String vdolevNum, String vdodtlNm, String vdodtlDtl,
			String vdodtlSumy, String vdodtlPlytm, Date vdodtlRedt, String vdodtlLik, String vdodtlImg, long atchFileId,
			String streFileNm) {
		super();
		this.vdodtlNum = vdodtlNum;
		this.vdotyNum = vdotyNum;
		this.vdolevNum = vdolevNum;
		this.vdodtlNm = vdodtlNm;
		this.vdodtlDtl = vdodtlDtl;
		this.vdodtlSumy = vdodtlSumy;
		this.vdodtlPlytm = vdodtlPlytm;
		this.vdodtlRedt = vdodtlRedt;
		this.vdodtlLik = vdodtlLik;
		this.vdodtlImg = vdodtlImg;
		this.atchFileId = atchFileId;
		this.streFileNm = streFileNm;
	}

	public String getVdodtlNum() {
		return vdodtlNum;
	}

	public void setVdodtlNum(String vdodtlNum) {
		this.vdodtlNum = vdodtlNum;
	}

	public String getVdotyNum() {
		return vdotyNum;
	}

	public void setVdotyNum(String vdotyNum) {
		this.vdotyNum = vdotyNum;
	}

	public String getVdolevNum() {
		return vdolevNum;
	}

	public void setVdolevNum(String vdolevNum) {
		this.vdolevNum = vdolevNum;
	}

	public String getVdodtlNm() {
		return vdodtlNm;
	}

	public void setVdodtlNm(String vdodtlNm) {
		this.vdodtlNm = vdodtlNm;
	}

	public String getVdodtlDtl() {
		return vdodtlDtl;
	}

	public void setVdodtlDtl(String vdodtlDtl) {
		this.vdodtlDtl = vdodtlDtl;
	}

	public String getVdodtlSumy() {
		return vdodtlSumy;
	}

	public void setVdodtlSumy(String vdodtlSumy) {
		this.vdodtlSumy = vdodtlSumy;
	}

	public String getVdodtlPlytm() {
		return vdodtlPlytm;
	}

	public void setVdodtlPlytm(String vdodtlPlytm) {
		this.vdodtlPlytm = vdodtlPlytm;
	}

	public Date getVdodtlRedt() {
		return vdodtlRedt;
	}

	public void setVdodtlRedt(Date vdodtlRedt) {
		this.vdodtlRedt = vdodtlRedt;
	}

	public String getVdodtlLik() {
		return vdodtlLik;
	}

	public void setVdodtlLik(String vdodtlLik) {
		this.vdodtlLik = vdodtlLik;
	}

	public String getVdodtlImg() {
		return vdodtlImg;
	}

	public void setVdodtlImg(String vdodtlImg) {
		this.vdodtlImg = vdodtlImg;
	}

	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getStreFileNm() {
		return streFileNm;
	}

	public void setStreFileNm(String streFileNm) {
		this.streFileNm = streFileNm;
	}

	@Override
	public String toString() {
		return "VdodtlVO [vdodtlNum=" + vdodtlNum + ", vdotyNum=" + vdotyNum + ", vdolevNum=" + vdolevNum
				+ ", vdodtlNm=" + vdodtlNm + ", vdodtlDtl=" + vdodtlDtl + ", vdodtlSumy=" + vdodtlSumy
				+ ", vdodtlPlytm=" + vdodtlPlytm + ", vdodtlRedt=" + vdodtlRedt + ", vdodtlLik=" + vdodtlLik
				+ ", vdodtlImg=" + vdodtlImg + ", atchFileId=" + atchFileId + ", streFileNm=" + streFileNm + "]";
	}

	
}
