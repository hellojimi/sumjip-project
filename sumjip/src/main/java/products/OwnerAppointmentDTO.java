package products;

public class OwnerAppointmentDTO {
	String pname; // 펜션 이름
	int auser; // 예약 회원 no
	int astatus; // 예약상태 
	int puser; // 펜션 사장님 no
	String indate; // 입실일
	String outdate; // 퇴실일
	int sprice; // 총 가격
	String sdate; // 예약일
	int pno; // 숙소번호

	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getAuser() {
		return auser;
	}
	public void setAuser(int auser) {
		this.auser = auser;
	}
	public int getAstatus() {
		return astatus;
	}
	public void setAstatus(int astatus) {
		this.astatus = astatus;
	}
	public int getPuser() {
		return puser;
	}
	public void setPuser(int puser) {
		this.puser = puser;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getOutdate() {
		return outdate;
	}
	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	
}
