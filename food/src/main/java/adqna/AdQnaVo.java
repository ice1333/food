package adqna;

import java.sql.Timestamp;

public class AdQnaVo extends SearchVo{

	private int adqna_no;
	private String aq_title;
	private String aq_contents;
	private String filename_org;
	private String filename_real;
	private Timestamp aq_regdate;
	private String aq_status;
	private int u_no;
	private int a_no;
	private String tablename;
	private String status;
	private String u_name;
	private String u_uemail;
	private String filename_org2;
	private String filename_real2;
	
	
	
	
	public String getFilename_org2() {
		return filename_org2;
	}
	public void setFilename_org2(String filename_org2) {
		this.filename_org2 = filename_org2;
	}
	public String getFilename_real2() {
		return filename_real2;
	}
	public void setFilename_real2(String filename_real2) {
		this.filename_real2 = filename_real2;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getAq_status() {
		return aq_status;
	}
	public void setAq_status(String aq_status) {
		this.aq_status = aq_status;
	}
	public int getAdqna_no() {
		return adqna_no;
	}
	public void setAdqna_no(int adqna_no) {
		this.adqna_no = adqna_no;
	}
	public String getAq_title() {
		return aq_title;
	}
	public void setAq_title(String aq_title) {
		this.aq_title = aq_title;
	}
	public String getAq_contents() {
		return aq_contents;
	}
	public void setAq_contents(String aq_contents) {
		this.aq_contents = aq_contents;
	}
	
	public String getFilename_org() {
		return filename_org;
	}
	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}
	public String getFilename_real() {
		return filename_real;
	}
	public void setFilename_real(String filename_real) {
		this.filename_real = filename_real;
	}
	public Timestamp getAq_regdate() {
		return aq_regdate;
	}
	public void setAq_regdate(Timestamp aq_regdate) {
		this.aq_regdate = aq_regdate;
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
	
	
}
