package kr.or.ddit.ott.pophis.vo;

public class PopHisVO {
	private String pophisNum;

	public PopHisVO() {}

	public PopHisVO(String pophisNum) {
		super();
		this.pophisNum = pophisNum;
	}

	public String getPophisNum() {
		return pophisNum;
	}

	public void setPophisNum(String pophisNum) {
		this.pophisNum = pophisNum;
	}

	@Override
	public String toString() {
		return "PopHisVO [pophisNum=" + pophisNum + "]";
	}
}
