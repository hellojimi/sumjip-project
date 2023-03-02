package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SalesDAO {
	public Connection getConnection() throws Exception{

		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	
	public void insertSales(SalesDTO dto) { // 숙소판매 입력
		System.out.println("SalesDAO insertSales()");
    	Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=getConnection();
		int sno=1;
		String sql="select max(sno) from sales";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			sno=rs.getInt("max(sno)")+1;
		}
		sql="insert into sales(sno, ano, pno, sdate, indate, outdate, sprice) values(?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, sno);  
		pstmt.setInt(2, dto.getAno()); 
		pstmt.setInt(3, dto.getPno());
		pstmt.setTimestamp(4, dto.getSdate());
		pstmt.setString(5, dto.getIndate());
		pstmt.setString(6, dto.getOutdate());
		pstmt.setInt(7, dto.getSprice());
		pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
		if(con!=null) try { con.close();} catch (Exception e2) {}
		
	}
	
	// pno로 리뷰 작성여부 조회
			public boolean checksSales1(int pno, String indate, String outdate) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				boolean checkSales1 = true;
				try {
					con = getConnection();
					String sql = "select * from sales where pno=? && ? >= ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, pno);
					pstmt.setString(2, indate);
					pstmt.setString(3, outdate);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						checkSales1 = true;
					} else {
						checkSales1 = false;
					}
				} catch (Exception e) {
					e.printStackTrace();
					
				} finally {
					if(con != null) try {con.close();} catch (Exception e2) {}
					if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
					if(rs != null) try {rs.close();} catch (SQLException e) {}
				}
				return checkSales1;
			}
	
	// pno로 리뷰 작성여부 조회
		public boolean checksSales2(int pno, String indate, String outdate) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean checkSales2 = true;
			try {
				con = getConnection();
				String sql = "select * from sales where pno=? && ano in (select ano from sales where (indate >= ? && indate < ?)|| (outdate > ? && outdate <= ?))";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pno);
				pstmt.setString(2, indate);
				pstmt.setString(3, outdate);
				pstmt.setString(4, indate);
				pstmt.setString(5, outdate);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					checkSales2 = true;
				} else {
					checkSales2 = false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				if(con != null) try {con.close();} catch (Exception e2) {}
				if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
				if(rs != null) try {rs.close();} catch (SQLException e) {}
			}
			return checkSales2;
		}
						
	public void deleteSales(int ano) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from sales where ano=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//deleteSales
	

	// 회원별 sales테이블 조회
	public SalesDTO getSalesAno(int ano) {
		SalesDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from sales where ano=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new SalesDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getString("indate"));
				dto.setOutdate(rs.getString("outdate"));
				dto.setSprice(rs.getInt("sprice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getSalesAno()
	
	// sales 테이블 조회
	public ArrayList<SalesDTO> getSalesList(){
		ArrayList<SalesDTO> SalesList=new ArrayList<SalesDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from Sales";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();	
			while(rs.next()) {
				SalesDTO dto=new SalesDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getString("indate"));
				dto.setOutdate(rs.getString("outdate"));
				dto.setSprice(rs.getInt("sprice"));
				SalesList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return SalesList;
	}//getSalesList()
}