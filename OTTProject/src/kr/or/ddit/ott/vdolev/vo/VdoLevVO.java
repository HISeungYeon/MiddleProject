package kr.or.ddit.ott.vdolev.vo;

public class VdoLevVO {
	private String vdolevNum;
	private String vdolevNm;

	public VdoLevVO() {}

	public VdoLevVO(String vdoLevNum, String vdoLevNm) {
		super();
		this.vdolevNum = vdoLevNum;
		this.vdolevNm = vdoLevNm;
	}

	public String getVdoLevNum() {
		return vdolevNum;
	}

	public void setVdoLevNum(String vdoLevNum) {
		this.vdolevNum = vdoLevNum;
	}

	public String getVdoLevNm() {
		return vdolevNm;
	}

	public void setVdoLevNm(String vdoLevNm) {
		this.vdolevNm = vdoLevNm;
	}

	@Override
	public String toString() {
		return "VideoLevVO [vdoLevNum=" + vdolevNum + ", vdoLevNm=" + vdolevNm + "]";
	}
	
	
}
