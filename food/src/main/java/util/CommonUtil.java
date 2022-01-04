package util;

public class CommonUtil {
	public static String getPageArea(String url, int curPage, int totPage,int pageRange) {
		// 페이지범위
		int startPage =(curPage-1)/pageRange*pageRange+1;
		int endPage = startPage+pageRange -1; // 종료페이지
		if(endPage>totPage) endPage = totPage;
				
		String ret = "";
		ret+=" <div class=\"pagenate clear\">\n"
				+ "                        <ul class='paging'>\n";
		if(startPage > pageRange) {
		ret += "                        	<li><a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\n";
		}
		for(int rp = startPage;rp <= endPage;  rp++) {
			ret+=		 "                            <li><a href='javascript:location.href=\""+url+"?page="+rp+"\";'";
			if(rp==curPage) ret+= "class='current'";
			ret += ">"+rp+"</a></li>\r\n";
		}
		if(totPage>endPage) {
			ret += "                        	<li><a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";
		}
		ret += "                        </ul> \n"
				+"                    </div>";
		return ret;
	}
}
