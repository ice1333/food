package user;

import java.sql.Timestamp;

public class UserVo {
	
	
	private int u_no;
	private String u_uemail;
	private String u_pwd;
	private String u_name;
	private int u_gender;
	private String u_tel;
	private Timestamp u_regdate;
	private int u_status;
	private String u_zuocide;
	private String u_addr1;
	private String u_addr2;
	

	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_uemail() {
		return u_uemail;
	}
	public void setU_uemail(String u_uemail) {
		this.u_uemail = u_uemail;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getU_gender() {
		return u_gender;
	}
	public void setU_gender(int u_gender) {
		this.u_gender = u_gender;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public Timestamp getU_regdate() {
		return u_regdate;
	}
	public void setU_regdate(Timestamp u_regdate) {
		this.u_regdate = u_regdate;
	}
	public int getU_status() {
		return u_status;
	}
	public void setU_status(int u_status) {
		this.u_status = u_status;
	}
	public String getU_zuocide() {
		return u_zuocide;
	}
	public void setU_zuocide(String u_zuocide) {
		this.u_zuocide = u_zuocide;
	}
	public String getU_addr1() {
		return u_addr1;
	}
	public void setU_addr1(String u_addr1) {
		this.u_addr1 = u_addr1;
	}
	public String getU_addr2() {
		return u_addr2;
	}
	public void setU_addr2(String u_addr2) {
		this.u_addr2 = u_addr2;
	}
}
