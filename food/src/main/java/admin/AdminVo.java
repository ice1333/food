package admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import util.CommonVo;

public class AdminVo extends CommonVo {
	private int a_no;
	private String a_id;
	private String a_pw;
	private int a_rank;
	private int a_status;
	private String a_name;
	private Timestamp a_regdate;
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_pw() {
		return a_pw;
	}
	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}
	public int getA_rank() {
		return a_rank;
	}
	public void setA_rank(int a_rank) {
		this.a_rank = a_rank;
	}
	public int getA_status() {
		return a_status;
	}
	public void setA_status(int a_status) {
		this.a_status = a_status;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public Timestamp getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Timestamp a_regdate) {
		this.a_regdate = a_regdate;
	}
	}
