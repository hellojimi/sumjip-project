package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommendDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	} // 디비연결
	
	public void insertCommend(CommendDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			int cno=1;
			String sql = "select max(cno) from commend";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cno=rs.getInt("max(cno)")+1;
			}
			sql = "insert into commend values(?, ?, ?, ?, ?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, dto.getBno());
			pstmt.setInt(3, dto.getNo());
			pstmt.setInt(4, dto.getRno());
			pstmt.setString(5, dto.getCommend());
			pstmt.setTimestamp(6, dto.getCdate());
			pstmt.executeUpdate();
			System.out.println("insert 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
	} // 대댓글 등록
	
	public CommendDTO getCommend(int cno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommendDTO dto = null;
		try {
			con = getConnection();
			String sql = "select * from commend where cno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			dto = new CommendDTO(); 
			dto.setCno(rs.getInt("cno"));
			dto.setBno(rs.getInt("bno"));
			dto.setNo(rs.getInt("no"));
			dto.setRno(rs.getInt("rno"));
			dto.setCommend(rs.getString("commend"));
			dto.setCdate(rs.getTimestamp("cdate"));
			}
			}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
		}
		return dto;
	} // cno로 commend 테이블 조회
	
	public void updateCommend(CommendDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update commend set commend = ? where cno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCommend());
			pstmt.setInt(2, dto.getCno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
		}
	} // 대댓글 수정
	
	public void deleteCommend(int cno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from commend where cno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
		}
	} // 대댓글 삭제
	
	public ArrayList<CommendDTO> getCommendList(int rno){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommendDTO> commendlist = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select * from commend where rno =? order by cno";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CommendDTO dto = new CommendDTO();
				dto.setCno(rs.getInt("cno"));
				dto.setBno(rs.getInt("bno"));
				dto.setNo(rs.getInt("no"));
				dto.setRno(rs.getInt("rno"));
				dto.setCommend(rs.getString("commend"));
				dto.setCdate(rs.getTimestamp("cdate"));
				commendlist.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();;
		} finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
		}
		return commendlist;
	} // 대댓글 리스트
	
}
