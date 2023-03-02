package qna;

import java.sql.Timestamp;

public class QnaDTO {
	private int qno; // 질문번호
	private int no; // 유저번호
	private String qtitle; // 제목
	private String qcontent; // 내용
	private String answer; // 답변
	private int qstatus; // 답변상태
	private int qcount; // 뷰카운트
	private Timestamp qdate; // 질문시간
	private Timestamp qadate; // 답변시간
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getQstatus() {
		return qstatus;
	}
	public void setQstatus(int qstatus) {
		this.qstatus = qstatus;
	}
	public int getQcount() {
		return qcount;
	}
	public void setQcount(int qcount) {
		this.qcount = qcount;
	}
	public Timestamp getQdate() {
		return qdate;
	}
	public void setQdate(Timestamp qdate) {
		this.qdate = qdate;
	}
	public Timestamp getQadate() {
		return qadate;
	}
	public void setQadate(Timestamp qadate) {
		this.qadate = qadate;
	}
	
	
}
