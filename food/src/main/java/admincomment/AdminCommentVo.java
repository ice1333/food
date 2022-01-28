package admincomment;

import java.sql.Timestamp;

import util.CommonVo;

public class AdminCommentVo extends CommonVo{

	private int adc_no;
	private int r_no;
	private String r_name;
	private int u_no;
	private String u_name;
	private int c_no;
	private String content;
	private String stars;
	private Timestamp regdate;
	private int adc_status;
	
	public int getAdc_no() {
		return adc_no;
	}
	public void setAdc_no(int adc_no) {
		this.adc_no = adc_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getAdc_status() {
		return adc_status;
	}
	public void setAdc_status(int adc_status) {
		this.adc_status = adc_status;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStars() {
		return stars;
	}
	public void setStars(String stars) {
		this.stars = stars;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
