package chart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CountRegion {

	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	} // 디비연결
	
	
	
	public RegionDTO getsalesproduct() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RegionDTO dto = null;
		try {
			con = getConnection();
			String sql = "select count(if(paddress like '%중문%' or paddress2 like '%중문%', 1, null)) as \"중문\", count(if(paddress like '%애월%' or paddress2 like '%애월%', 1, null)) as \"애월\",\r\n"
					+ "count(if(paddress like '%우도%' or paddress2 like '%우도%', 1, null)) as \"우도\", count(if(paddress like '%성산%' or paddress2 like '%성산%', 1, null)) as \"성산\", count(if(paddress like '%중문%' or paddress2 like '%중문%' or paddress like '%애월%' or paddress2 like '%애월%' or paddress like '%우도%' or paddress2 like '%우도%' or paddress like '%성산%' or paddress2 like '%성산%', null,1)) as \"그외\"\r\n"
					+ "from products p join sales s\r\n"
					+ "on p.pno = s.pno";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new RegionDTO();
				dto.set중문(rs.getInt("중문"));
				dto.set애월읍(rs.getInt("애월"));
				dto.set우도(rs.getInt("우도"));
				dto.set성산읍(rs.getInt("성산"));
				dto.set그외(rs.getInt("그외"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
		}
		
		return dto;
	}
	
	
}
