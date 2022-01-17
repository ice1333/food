package admincomment;

import java.sql.Timestamp;

import util.CommonVo;

public class AdminCommentVo extends CommonVo{

	private int adc_no;
	private String u_name;
	private Timestamp c_regdate;
	private String c_stars;
	private String c_contents;
	private int r_no;
	private int u_no;
	private int a_no;
	private int adc_status;
	
	

	
	public int getAdc_no() {
		return adc_no;
	}
	public void setAdc_no(int adc_no) {
		this.adc_no = adc_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getAdc_status() {
		return adc_status;
	}
	public void setAdc_status(int adc_status) {
		this.adc_status = adc_status;
	}
	public Timestamp getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Timestamp c_regdate) {
		this.c_regdate = c_regdate;
	}
	public String getC_stars() {
		return c_stars;
	}
	public void setC_stars(String c_stars) {
		this.c_stars = c_stars;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getC_contents() {
		return c_contents;
	}
	public void setC_contents(String c_contents) {
		this.c_contents = c_contents;
	}
	

	
	
}
