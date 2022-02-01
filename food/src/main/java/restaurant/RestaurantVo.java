package restaurant;

import java.sql.Timestamp;

import util.CommonVo;

public class RestaurantVo extends CommonVo{
	
	private int r_no;
	private String r_name;
	private String r_address;
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
	private Timestamp r_regdate;
	private int r_status;
	private String a;
	private String b;
	private String c;
	private String d;
	private String f_han;
	private String f_bun;
	private String f_il;
	private String f_jung;
	private String f_go;
	private String f_tang;
	private String f_don;
	private String f_yang;
	private String park_no;
	private String park_yes;
	
	
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	public String getF_han() {
		return f_han;
	}
	public void setF_han(String f_han) {
		this.f_han = f_han;
	}
	public String getF_bun() {
		return f_bun;
	}
	public void setF_bun(String f_bun) {
		this.f_bun = f_bun;
	}
	public String getF_il() {
		return f_il;
	}
	public void setF_il(String f_il) {
		this.f_il = f_il;
	}
	public String getF_jung() {
		return f_jung;
	}
	public void setF_jung(String f_jung) {
		this.f_jung = f_jung;
	}
	public String getF_go() {
		return f_go;
	}
	public void setF_go(String f_go) {
		this.f_go = f_go;
	}
	public String getF_tang() {
		return f_tang;
	}
	public void setF_tang(String f_tang) {
		this.f_tang = f_tang;
	}
	public String getF_don() {
		return f_don;
	}
	public void setF_don(String f_don) {
		this.f_don = f_don;
	}
	public String getF_yang() {
		return f_yang;
	}
	public void setF_yang(String f_yang) {
		this.f_yang = f_yang;
	}
	public String getPark_no() {
		return park_no;
	}
	public void setPark_no(String park_no) {
		this.park_no = park_no;
	}
	public String getPark_yes() {
		return park_yes;
	}
	public void setPark_yes(String park_yes) {
		this.park_yes = park_yes;
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
