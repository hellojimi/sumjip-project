package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	// 후기 등록
	public void insertReview(ReviewDTO dto) {
		System.out.println("ReviewDAO insertReview()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			int rno = 1;
			String sql = "select max(rno) from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rno = rs.getInt("max(rno)") + 1;
			}
			sql = "insert into review(rno, no, pno, ano, rtitle, rstar, rcontent, rdate, rpic1, rpic2, rpic3)"
			    + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);  // 게시글번호
			pstmt.setInt(2, dto.getNo()); // 유저번호
			pstmt.setInt(3, dto.getPno()); // 상품번호
			pstmt.setInt(4, dto.getAno()); // 예약번호
			pstmt.setString(5, dto.getRtitle());
			pstmt.setString(6, dto.getRstar());
			pstmt.setString(7, dto.getRcontent());
			pstmt.setTimestamp(8, dto.getRdate());
			pstmt.setString(9, dto.getRpic1());
			pstmt.setString(10, dto.getRpic2());
			pstmt.setString(11, dto.getRpic3());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		
	} // insertReview()
	
	// 후기 내용 받아오기
	public ReviewDTO getReview(int ano) {
		System.out.println("ReviewDTO getReview()");
		ReviewDTO rdto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from review where ano = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rdto = new ReviewDTO();
				rdto.setAno(rs.getInt("ano"));
				rdto.setRno(rs.getInt("rno"));
				rdto.setRtitle(rs.getString("rtitle"));
				rdto.setRcontent(rs.getString("rcontent"));
				rdto.setRstar(rs.getString("rstar"));
				rdto.setRpic1(rs.getString("rpic1"));
				rdto.setRpic2(rs.getString("rpic2"));
				rdto.setRpic3(rs.getString("rpic3"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return rdto;
	} // getReview()
	
	// 리뷰 리스트
	public ArrayList<ReviewDTO> getReviewList(int startRow, int pageSize){
		System.out.println("ReviewDAO getReviewList()");
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql="select * from review order by pno desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewDTO rdto=new ReviewDTO();
				rdto.setPno(rs.getInt("pno"));
				rdto.setRtitle(rs.getString("rtitle"));
				rdto.setRstar(rs.getString("rstar"));
				rdto.setRcontent(rs.getString("rcontent"));
				rdto.setRdate(rs.getTimestamp("rdate"));
				rdto.setRpic1(rs.getString("rpic1"));
				rdto.setRpic2(rs.getString("rpic2"));
				rdto.setRpic3(rs.getString("rpic3"));
				reviewList.add(rdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return reviewList;
		
	} // getReviewList()
	
	// 리뷰 리스트(pno 값 들고감)
	public ArrayList<ReviewDTO> getReviewList(int startRow, int pageSize, int pno){
		System.out.println("ReviewDAO getReviewList()");
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql="select * from review where pno = ? order by pno desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewDTO rdto=new ReviewDTO();
				rdto.setNo(rs.getInt("no"));
				rdto.setRno(rs.getInt("rno"));
				rdto.setPno(rs.getInt("pno"));
				rdto.setAno(rs.getInt("ano"));
				rdto.setRtitle(rs.getString("rtitle"));
				rdto.setRstar(rs.getString("rstar"));
				rdto.setRcontent(rs.getString("rcontent"));
				rdto.setRdate(rs.getTimestamp("rdate"));
				rdto.setRpic1(rs.getString("rpic1"));
				rdto.setRpic2(rs.getString("rpic2"));
				rdto.setRpic3(rs.getString("rpic3"));
				
				reviewList.add(rdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return reviewList;
		
	} // getReviewList()
	
	// ano로 리뷰 작성여부 조회
	public boolean checkReview(int ano) {
		System.out.println("ReviewDTO ReviewCheck()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checkReview = true;
		try {
			con = getConnection();
			String sql = "select * from review where ano = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checkReview = true;
			} else {
				checkReview = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return checkReview;
	
	} // ReviewCheck()
	
	// 후기 수정
	public void updateReview(ReviewDTO rdto) {
		System.out.println("ReviewDAO updateReivew()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update review set rtitle=?, rstar=?, rcontent=?, rpic1=?, rpic2=?, rpic3=? where rno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getRtitle());
			pstmt.setString(2, rdto.getRstar());
			pstmt.setString(3, rdto.getRcontent());
			pstmt.setString(4, rdto.getRpic1());
			pstmt.setString(5, rdto.getRpic2());
			pstmt.setString(6, rdto.getRpic3());
			pstmt.setInt(7, rdto.getRno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
		}
	} // updateReview()
	
	// 후기 삭제
	public void deleteReview(int ano) {
		System.out.println("ReviewDAO deleteReview()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from review where ano = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
		}
	} // deleteReview()
	
	// 리뷰 수 세기
	public int getReviewCount() {
		System.out.println("ReviewDAO getReviewCount()");
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select count(*) from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return count;
	} // getReviewCount()
	
	// 별점 합산
	public int sumStar(int pno) {
		int sumstar = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select sum(rstar) from review where pno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sumstar = rs.getInt("sum(rstar)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return sumstar;
	} // sumStar()
	
}
