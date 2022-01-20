package util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommonVo {
	private String searchType;
	private String searchWord;
	private String orderCond;
	private int startIdx; //limit 시작값
	private int page; //사용자가 요청한 페이지 
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getOrderCond() {
		return orderCond;
	}

	public void setOrderCond(String orderCond) {
		this.orderCond = orderCond;
	}

	public int getStartIdx() {
		return startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public CommonVo() {  //초기값 1페이지 
		page = 1;
	}
	
	
//	public String getSearchWord() {
//		return this.searchWord.toUpperCase();
//	}
}
