package kr.or.ddit.ott.vdodtl.vo;

public class SearchVO {
	private String part;
	private String searchData;
	private String streFileNm;
	
	public SearchVO() {}

	public SearchVO(String part, String searchData, String streFileNm) {
		super();
		this.part = part;
		this.searchData = searchData;
		this.streFileNm = streFileNm;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

	public String getStreFileNm() {
		return streFileNm;
	}

	public void setStreFileNm(String streFileNm) {
		this.streFileNm = streFileNm;
	}

	@Override
	public String toString() {
		return "SearchVO [part=" + part + ", searchData=" + searchData + ", streFileNm=" + streFileNm + "]";
	}
	
}
