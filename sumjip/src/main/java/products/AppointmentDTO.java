package products;

import java.sql.Timestamp;

public class AppointmentDTO {
	private int ano; //예약번호
	private int pno; //상품번호
	private int no; //유저번호
	private int astatus; //예약상태
	private Timestamp adate; //예약일자
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAstatus() {
		return astatus;
	}
	public void setAstatus(int astatus) {
		this.astatus = astatus;
	}
	public Timestamp getAdate() {
		return adate;
	}
	public void setAdate(Timestamp adate) {
		this.adate = adate;
	}
	
	
}
