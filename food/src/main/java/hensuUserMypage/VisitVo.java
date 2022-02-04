package hensuUserMypage;

import java.sql.Timestamp;

import util.CommonVo;

public class VisitVo extends CommonVo {

	private int v_no;
	private int r_no;
	private int u_no;
	private Timestamp v_date;
	private String r_foodtype;
	private int r_stars;
	private String r_name;
	private String r_filename_real;
	
	public int getV_no() {
		return v_no;
	}
	public void setV_no(int v_no) {
		this.v_no = v_no;
	}
	
	public String getR_foodtype() {
		return r_foodtype;
	}
	public void setR_foodtype(String r_foodtype) {
		this.r_foodtype = r_foodtype;
	}
	public int getR_stars() {
		return r_stars;
	}
	public void setR_stars(int r_stars) {
		this.r_stars = r_stars;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_filename_real() {
		return r_filename_real;
	}
	public void setR_filename_real(String r_filename_real) {
		this.r_filename_real = r_filename_real;
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
	public Timestamp getV_date() {
		return v_date;
	}
	public void setV_date(Timestamp v_date) {
		this.v_date = v_date;
	}
	
}
