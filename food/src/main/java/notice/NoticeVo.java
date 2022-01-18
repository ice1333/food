package notice;

import java.sql.Timestamp;


import util.CommonVo;


public class NoticeVo extends CommonVo {
	
	private int n_no;
	private String n_title;
	private String n_content;
	private Timestamp n_regdate;
	private int n_readcount;
	private Timestamp n_editdate;
	private int a_no;
	private String n_fileorg;
	private String n_filereal;
	
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Timestamp getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Timestamp n_regdate) {
		this.n_regdate = n_regdate;
	}
	public int getN_readcount() {
		return n_readcount;
	}
	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
	public Timestamp getN_editdate() {
		return n_editdate;
	}
	public void setN_editdate(Timestamp n_editdate) {
		this.n_editdate = n_editdate;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getN_fileorg() {
		return n_fileorg;
	}
	public void setN_fileorg(String n_fileorg) {
		this.n_fileorg = n_fileorg;
	}
	public String getN_filereal() {
		return n_filereal;
	}
	public void setN_filereal(String n_filereal) {
		this.n_filereal = n_filereal;
	}
	
	
}
	
