package comment;

import java.sql.Timestamp;

import util.CommonVo;


public class CommentVo extends CommonVo{
	
	private int c_no;
	private int a_no;
	private String tablename;
	private String content;
	private int u_no;
	private int adqna_no;
	private Timestamp regdate;
	private String u_name;
	private int r_no;
	private String r_name;
	private int stars;
	private int adc_no;
	
	
	
	
	
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public int getR_no() {
		return r_no;
	}
	
	public int getAdc_no() {
		return adc_no;
	}
	public void setAdc_no(int adc_no) {
		this.adc_no = adc_no;
	}
	
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getAdqna_no() {
		return adqna_no;
	}
	public void setAdqna_no(int adqna_no) {
		this.adqna_no = adqna_no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
}
