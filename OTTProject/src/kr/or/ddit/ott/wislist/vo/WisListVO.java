package kr.or.ddit.ott.wislist.vo;

public class WisListVO {
	private String wislistNum;
	private String memNum;
	private String vdodtlNum;
	private String wislistDate;
	private String streFileNm;
	private String vdodtlNm;
	private String memEm;

	public WisListVO() {}

	
	public WisListVO(String memNum, String vdodtlNum) {
		super();
		this.memNum = memNum;
		this.vdodtlNum = vdodtlNum;
	}


	public WisListVO(String wislistNum, String memNum, String vdodtlNum, String wislistDate, String streFileNm,
			String vdodtlNm, String memEm) {
		super();
		this.wislistNum = wislistNum;
		this.memNum = memNum;
		this.vdodtlNum = vdodtlNum;
		this.wislistDate = wislistDate;
		this.streFileNm = streFileNm;
		this.vdodtlNm = vdodtlNm;
		this.memEm = memEm;
	}

	public String getWislistNum() {
		return wislistNum;
	}

	public void setWislistNum(String wislistNum) {
		this.wislistNum = wislistNum;
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

	public String getWislistDate() {
		return wislistDate;
	}

	public void setWislistDate(String wislistDate) {
		this.wislistDate = wislistDate;
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
		return "WisListVO [wislistNum=" + wislistNum + ", memNum=" + memNum + ", vdodtlNum=" + vdodtlNum
				+ ", wislistDate=" + wislistDate + ", streFileNm=" + streFileNm + ", vdodtlNm=" + vdodtlNm + ", memEm="
				+ memEm + "]";
	}

	

}
