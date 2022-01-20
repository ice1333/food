package restaurant;

import java.sql.Timestamp;

import util.CommonVo;

public class RestaurantQnaVo extends CommonVo{
	private int rqna_no;
	private String rqna_title;
	private String rqna_contents; 
	private String rqna_filename_org;
	private String rqna_filename_real;
	private Timestamp rqna_regdate;
	private String rqna_status;
	private int u_no;
	private int a_no;
	private String u_name;
	private String u_uemail;
	private String searchType;
	
	
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
	private String searchWord;
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_uemail() {
		return u_uemail;
	}
	public void setU_uemail(String u_uemail) {
		this.u_uemail = u_uemail;
	}
	public int getRqna_no() {
		return rqna_no;
	}
	public void setRqna_no(int rqna_no) {
		this.rqna_no = rqna_no;
	}
	public String getRqna_title() {
		return rqna_title;
	}
	public void setRqna_title(String rqna_title) {
		this.rqna_title = rqna_title;
	}
	public String getRqna_contents() {
		return rqna_contents;
	}
	public void setRqna_contents(String rqna_contents) {
		this.rqna_contents = rqna_contents;
	}
	public String getRqna_filename_org() {
		return rqna_filename_org;
	}
	public void setRqna_filename_org(String rqna_filename_org) {
		this.rqna_filename_org = rqna_filename_org;
	}
	public String getRqna_filename_real() {
		return rqna_filename_real;
	}
	public void setRqna_filename_real(String rqna_filename_real) {
		this.rqna_filename_real = rqna_filename_real;
	}
	public Timestamp getRqna_regdate() {
		return rqna_regdate;
	}
	public void setRqna_regdate(Timestamp rqna_regdate) {
		this.rqna_regdate = rqna_regdate;
	}
	public String getRqna_status() {
		return rqna_status;
	}
	public void setRqna_status(String rqna_status) {
		this.rqna_status = rqna_status;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public void setStartIdx(int startIdx) {
		
	}
	public int getPage() {
		return 0;
	}
	public static Object no_select(int rqna_no) {
		return null;
	}
}
