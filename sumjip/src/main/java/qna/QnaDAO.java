package qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardDTO;

public class QnaDAO {
	private Connection getConnection() throws Exception {	
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	} // 디비연결

	// 질문 등록
	public void insertQna(QnaDTO dto) {
		System.out.println("insertQna QnaDTO()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			int qno=1;
			String sql = "select max(qno) from qna";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qno=rs.getInt("max(qno)")+1;
			}
			sql="insert into qna(qno, no, qtitle, qcontent, qcount, qdate) "
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno); // 질문글번호 
			pstmt.setInt(2, dto.getNo()); // 유저번호
			pstmt.setString(3, dto.getQtitle()); // 질문제목
			pstmt.setString(4, dto.getQcontent()); // 질문글
			pstmt.setInt(5, dto.getQcount()); // 조회수	
			pstmt.setTimestamp(6, dto.getQdate()); // 질문날짜	
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//insertQna() 
	
	// 질문리스트
	public ArrayList<QnaDTO> getQnaList(int startRow,int pageSize){
		System.out.println("QnaDAO getQnaList()");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<QnaDTO> qnaList=new ArrayList<>();
		try {
			con=getConnection();
			String sql="select * from qna order by qno desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnaDTO dto=new QnaDTO();
				dto.setNo(rs.getInt("no"));
				dto.setQno(rs.getInt("qno"));
				dto.setQstatus(rs.getInt("qstatus"));
				dto.setQtitle(rs.getString("qtitle"));
				dto.setQcontent(rs.getString("qcontent"));
				dto.setQcount(rs.getInt("qcount"));
				dto.setQdate(rs.getTimestamp("qdate"));
				dto.setQadate(rs.getTimestamp("qadate"));
				qnaList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return qnaList;
	}// getQnaList()
	
	// 질문 내용 받아오기
	public QnaDTO getQna(int qno) {
		System.out.println("QnaDAO getQna()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		QnaDTO dto=null;
		try {
			con = getConnection();
			String sql = "select * from Qna where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rs=pstmt.executeQuery();
			while (rs.next()) { 
				dto = new QnaDTO();
				dto.setNo(rs.getInt("no"));
				dto.setQno(rs.getInt("qno"));
				dto.setQtitle(rs.getString("qtitle"));
				dto.setQcontent(rs.getString("qcontent"));
				dto.setAnswer(rs.getString("answer"));
				dto.setQcount(rs.getInt("qcount"));
				dto.setQdate(rs.getTimestamp("qdate"));
				dto.setQadate(rs.getTimestamp("qadate"));
				dto.setQstatus(rs.getInt("qstatus"));
						}
				} catch (Exception e) {
						e.printStackTrace(); // 에러처리
				} finally {
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return dto;
	}// getQna()

	// 질문 수정
	public void updateQna(QnaDTO dto) {
		System.out.println("QnaDAO updateQna()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update qna set qtitle=?, qcontent=? where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getQtitle());
			pstmt.setString(2, dto.getQcontent());
			pstmt.setInt(3, dto.getQno());
			pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
	}// updateQna()
	
	// 질문 삭제
	public void deleteQna(int qno) {
		System.out.println("QnaDAO deleteQna()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from qna where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 에러처리
		} finally {
			
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}	
	}// deleteQna()

	// qna 갯수 계산
	public int getQnaCount() {
		System.out.println("getQnaCount QnaDTO()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int count=0;
		try {
			con = getConnection();
			String sql = "select count(*) from qna";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) { 
			count=rs.getInt("count(*)");
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
			if (rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return count;
	}// getQnaCount()
	
	// 조회수 증가
	public void qCount(int qno) {
		System.out.println("qCount QnaDTO()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update qna set qcount = qcount +1 where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
	}
	
	// 답변 수정
	public void updateAnswer(QnaDTO dto) {
		System.out.println("updateAnswer()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update qna set answer=? where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getAnswer());
			pstmt.setInt(2, dto.getQno());
			pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
	}// updateQna()
	
	//질문 삭제
	public void deleteAnswer(int qno) {
		System.out.println("QnaDAO deleteAnswer()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update qna set answer=null, qstatus=1  where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 에러처리
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}	
	}// deleteQna()

	// 답변 입력
	public void insertAnswer(QnaDTO dto) {
		System.out.println("QnaDAO updateQna()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update qna set answer=?, qadate=?, qstatus=0 where qno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getAnswer());
			pstmt.setTimestamp(2, dto.getQadate());
			pstmt.setInt(3, dto.getQno());
			pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
	}// updateQna()
}

