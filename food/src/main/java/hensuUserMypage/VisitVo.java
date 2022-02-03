package hensuUserMypage;

import java.sql.Timestamp;

public class VisitVo {

	private int visitno;
	private int r_no;
	private int u_no;
	private Timestamp v_date;
	public int getVisitno() {
		return visitno;
	}
	public void setVisitno(int visitno) {
		this.visitno = visitno;
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
