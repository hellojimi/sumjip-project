package board;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.UserDTO;

    //DB연결
    public class BoardDAO {
    	public Connection getConnection() throws Exception{
    		Context init=new InitialContext();
    		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
    		Connection con=ds.getConnection();
    		return con;
    	}
   
	    // 공지사항 등록
	    public void insertBoard(BoardDTO dto) {
	    	System.out.println("BoardDAO insertBoard()");
	    	Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
		try {
			con=getConnection();
			int bno=1;
			String sql="select max(bno) from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bno=rs.getInt("max(bno)")+1;
			}
			sql="insert into board(bno, no, btitle, bcontent, bcount, bdate) values (?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, dto.getNo());
			pstmt.setString(3, dto.getBtitle());
			pstmt.setString(4, dto.getBcontent());
			pstmt.setInt(5, dto.getBcount());
			pstmt.setTimestamp(6, dto.getBdate());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		 }
		return;
		}// insertBoard()
		
		// 공지사항 리스트
		public ArrayList<BoardDTO> getBoardList(int startRow, int pageSize){
			System.out.println("BoardDAO getBoardList()");
			ArrayList<BoardDTO> boardList=new ArrayList<>();
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				
				String sql="select * from board order by bno desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO dto=new BoardDTO();

					dto.setBno(rs.getInt("bno"));
					dto.setNo(rs.getInt("no"));
					dto.setBtitle(rs.getString("btitle"));
					dto.setBcontent(rs.getString("bcontent"));
					dto.setBcount(rs.getInt("bcount"));
					dto.setBdate(rs.getTimestamp("bdate"));
					
					boardList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return boardList;
		}// getBoardList()
		
		public ArrayList<BoardDTO> getBoardList(int startRow, int pageSize, String search){
			System.out.println("BoardDAO getBoardList()");
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<BoardDTO> boardList=new ArrayList<>();
			try {
				con=getConnection();
				
				String sql="select * from board where btitle like? order by bno desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO dto=new BoardDTO();

					dto.setBno(rs.getInt("bno"));
					dto.setNo(rs.getInt("no"));
					dto.setBtitle(rs.getString("btitle"));
					dto.setBcontent(rs.getString("bcontent"));
					dto.setBcount(rs.getInt("bcount"));
					dto.setBdate(rs.getTimestamp("bdate"));
					
					boardList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return boardList;
		}// getBoardList()
		
		// bno로 공지사항 조회
		public BoardDTO getBoard(int bno) {
			System.out.println("BoardDAO getBoard()");
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			BoardDTO dto=null;
			try {
				con=getConnection();
				String sql="select * from board where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					dto=new BoardDTO();
					dto.setBno(rs.getInt("bno"));
					dto.setNo(rs.getInt("no"));
					dto.setBtitle(rs.getString("btitle"));
					dto.setBcontent(rs.getString("bcontent"));
					dto.setBcount(rs.getInt("bcount"));
					dto.setBdate(rs.getTimestamp("bdate"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//getBoard()
			
		
		// 공지사항 갯수 계산
		public int getBoardCount() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
					if(rs!=null) try { rs.close();} catch (Exception e2) {}
					if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
					if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return count;
		}//getBoardCount()
		
		public int getBoardCount(String search) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				String sql="select count(*) from board where btitle like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
					if(rs!=null) try { rs.close();} catch (Exception e2) {}
					if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
					if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return count;
		}//getBoardCount()
		
		// 조회수 증가
		public void bCount(int bno) {
			System.out.println("bCount BoardDTO()");
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = getConnection();
				String sql = "update board set bcount = bcount +1 where bno=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.executeUpdate();		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
			}
		}
		
		// 공지사항 삭제
		public void deleteBoard(int bno) {
			System.out.println("BoardDAO deleteBoard()");
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=getConnection();
				String sql="delete from board where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//deleteBoard()
		
		// 공지사항 수정
		public void updateBoard(BoardDTO dto) {
			System.out.println("BoardDAO updateBoard()");
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				con=getConnection();
				String sql="update board set btitle=?, bcontent=? where bno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, dto.getBtitle());
				pstmt.setString(2, dto.getBcontent());
				pstmt.setInt(3, dto.getBno());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//updateBoard()
			
    }//class
	   