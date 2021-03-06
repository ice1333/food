package restaurant;

import java.sql.Timestamp;

import util.CommonVo;

public class RestaurantVo extends CommonVo{
	
	private int r_no;
	private String r_name;
	private String r_address;
	private String r_address2;
	private String r_tel;
	private String r_menu;
	private String r_week;
	private String r_breaktime;
	private String r_holiday;
	private int r_parking;
	private int r_price;
	private String r_location;
	private String r_foodtype;
	private String r_side;
	private String r_event;
	private String r_zipcode;
	private int r_readcount;
	private int r_wishcount;
	private int r_stars;
	private int a_no;
	private int r_status;
	private int u_no;
	private String r_filename_org;
	private String r_filename_real;
	private String r_filename_org1;
	private String r_filename_real1;
	private String r_filename_org2;
	private String r_filename_real2; 
	private Timestamp r_regdate;
	private String searchType;
	private String searchWord;
	private double stars;
	
	
	
	public double getStars() {
		return stars;
	}
	public void setStars(double stars) {
		this.stars = stars;
	}
	//  필터 // 
	private String a1;
	private String a2;
	private String a3;
	private String a4;
	
	private String f1;
	private String f2;
	private String f3;
	private String f4;
	private String f5;
	private String f6;
	private String f7;
	private String f8;
	
	private String p1;
	private String p2;
	
	
	
	
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getA2() {
		return a2;
	}
	public void setA2(String a2) {
		this.a2 = a2;
	}
	public String getA3() {
		return a3;
	}
	public void setA3(String a3) {
		this.a3 = a3;
	}
	public String getA4() {
		return a4;
	}
	public void setA4(String a4) {
		this.a4 = a4;
	}
	public String getF1() {
		return f1;
	}
	public void setF1(String f1) {
		this.f1 = f1;
	}
	public String getF2() {
		return f2;
	}
	public void setF2(String f2) {
		this.f2 = f2;
	}
	public String getF3() {
		return f3;
	}
	public void setF3(String f3) {
		this.f3 = f3;
	}
	public String getF4() {
		return f4;
	}
	public void setF4(String f4) {
		this.f4 = f4;
	}
	public String getF5() {
		return f5;
	}
	public void setF5(String f5) {
		this.f5 = f5;
	}
	public String getF6() {
		return f6;
	}
	public void setF6(String f6) {
		this.f6 = f6;
	}
	public String getF7() {
		return f7;
	}
	public void setF7(String f7) {
		this.f7 = f7;
	}
	public String getF8() {
		return f8;
	}
	public void setF8(String f8) {
		this.f8 = f8;
	}
	public String getP1() {
		return p1;
	}
	public void setP1(String p1) {
		this.p1 = p1;
	}
	public String getP2() {
		return p2;
	}
	public void setP2(String p2) {
		this.p2 = p2;
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
	public String getR_filename_org() {
		return r_filename_org;
	}
	public void setR_filename_org(String r_filename_org) {
		this.r_filename_org = r_filename_org;
	}
	public String getR_filename_real() {
		return r_filename_real;
	}
	public void setR_filename_real(String r_filename_real) {
		this.r_filename_real = r_filename_real;
	}
	public String getR_filename_org1() {
		return r_filename_org1;
	}
	public void setR_filename_org1(String r_filename_org1) {
		this.r_filename_org1 = r_filename_org1;
	}
	public String getR_filename_real1() {
		return r_filename_real1;
	}
	public void setR_filename_real1(String r_filename_real1) {
		this.r_filename_real1 = r_filename_real1;
	}
	public String getR_filename_org2() {
		return r_filename_org2;
	}
	public void setR_filename_org2(String r_filename_org2) {
		this.r_filename_org2 = r_filename_org2;
	}
	public String getR_filename_real2() {
		return r_filename_real2;
	}
	public void setR_filename_real2(String r_filename_real2) {
		this.r_filename_real2 = r_filename_real2;
	}	
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
	public String getR_address2() {
		return r_address2;
	}
	public void setR_address2(String r_address2) {
		this.r_address2 = r_address2;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_address() {
		return r_address;
	}
	public void setR_address(String r_address) {
		this.r_address = r_address;
	}
	public String getR_tel() {
		return r_tel;
	}
	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}
	public String getR_menu() {
		return r_menu;
	}
	public void setR_menu(String r_menu) {
		this.r_menu = r_menu;
	}
	public String getR_week() {
		return r_week;
	}
	public void setR_week(String r_week) {
		this.r_week = r_week;
	}
	public String getR_breaktime() {
		return r_breaktime;
	}
	public void setR_breaktime(String r_breaktime) {
		this.r_breaktime = r_breaktime;
	}
	public String getR_holiday() {
		return r_holiday;
	}
	public void setR_holiday(String r_holiday) {
		this.r_holiday = r_holiday;
	}
	public int getR_parking() {
		return r_parking;
	}
	public void setR_parking(int r_parking) {
		this.r_parking = r_parking;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public String getR_location() {
		return r_location;
	}
	public void setR_location(String r_location) {
		this.r_location = r_location;
	}
	public String getR_foodtype() {
		return r_foodtype;
	}
	public void setR_foodtype(String r_foodtype) {
		this.r_foodtype = r_foodtype;
	}
	public String getR_side() {
		return r_side;
	}
	public void setR_side(String r_side) {
		this.r_side = r_side;
	}
	public String getR_event() {
		return r_event;
	}
	public void setR_event(String r_event) {
		this.r_event = r_event;
	}
	public String getR_zipcode() {
		return r_zipcode;
	}
	public void setR_zipcode(String r_zipcode) {
		this.r_zipcode = r_zipcode;
	}
	public int getR_readcount() {
		return r_readcount;
	}
	public void setR_readcount(int r_readcount) {
		this.r_readcount = r_readcount;
	}
	public int getR_wishcount() {
		return r_wishcount;
	}
	public void setR_wishcount(int r_wishcount) {
		this.r_wishcount = r_wishcount;
	}
	public int getR_stars() {
		return r_stars;
	}
	public void setR_stars(int r_stars) {
		this.r_stars = r_stars;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public Timestamp getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Timestamp r_regdate) {
		this.r_regdate = r_regdate;
	}
	public int getR_status() {
		return r_status;
	}
	public void setR_status(int r_status) {
		this.r_status = r_status;
	}
	
}
