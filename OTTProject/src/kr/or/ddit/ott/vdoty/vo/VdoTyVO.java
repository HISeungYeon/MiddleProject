package kr.or.ddit.ott.vdoty.vo;

public class VdoTyVO {
	private String vdotyNum;
	private String vdotyNm;

	public VdoTyVO() {}

	public VdoTyVO(String vdotyNum, String vdotyNm) {
		super();
		this.vdotyNum = vdotyNum;
		this.vdotyNm = vdotyNm;
	}

	public String getVdotyNum() {
		return vdotyNum;
	}

	public void setVdotyNum(String vdotyNum) {
		this.vdotyNum = vdotyNum;
	}

	public String getVdotyNm() {
		return vdotyNm;
	}

	public void setVdotyNm(String vdotyNm) {
		this.vdotyNm = vdotyNm;
	}

	@Override
	public String toString() {
		return "VideoTyVO [vdotyNum=" + vdotyNum + ", vdotyNm=" + vdotyNm + "]";
	}
}
