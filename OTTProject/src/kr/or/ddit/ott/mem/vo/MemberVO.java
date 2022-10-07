package kr.or.ddit.ott.mem.vo;

public class MemberVO {
	private String memNum;
	private String memEm;
	private String memNm;
	private String memTel;
	private String memPw;
	private String memNal;
	private String memBir;

	public MemberVO() {
		super();
	}

	public MemberVO(String memNum, String memEm, String memNm, String memTel, String memPw, String memNal,
			String memBir) {
		super();
		this.memNum = memNum;
		this.memEm = memEm;
		this.memNm = memNm;
		this.memTel = memTel;
		this.memPw = memPw;
		this.memNal = memNal;
		this.memBir = memBir;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getMemEm() {
		return memEm;
	}

	public void setMemEm(String memEm) {
		this.memEm = memEm;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemNal() {
		return memNal;
	}

	public void setMemNal(String memNal) {
		this.memNal = memNal;
	}

	public String getMemBir() {
		return memBir;
	}

	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}

	@Override
	public String toString() {
		return "MemberVO [memNum=" + memNum + ", memEm=" + memEm + ", memNm=" + memNm + ", memTel=" + memTel
				+ ", memPw=" + memPw + ", memNal=" + memNal + ", memBir=" + memBir + "]";
	}

}
