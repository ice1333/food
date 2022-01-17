package adqna;

public class SearchVo {
	
	private String searchType;
	private String searchWord;
	private String orderCond;
	private int page;
	private int startIdx;
	
	
	public SearchVo() {
		page = 1;
		
		}
	
	
	
	public int getStartIdx() {
		return startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}
	
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
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
}
