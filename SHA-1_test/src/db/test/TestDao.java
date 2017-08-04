package db.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import test.sha256.test1;

public class TestDao {
	OracleConnect db = new OracleConnect();
	test1 t1  = new test1();
	public void InsertTest(TestDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into tt values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2,dto.getPass());
			pstmt.setString(3, t1.endcoding(dto.getPass()));
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public Vector<TestDto> getSelectAll(){
		Vector<TestDto> list = new Vector<>();
		TestDto dto = null;
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql = "select * from tt";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new TestDto(rs.getString(1), rs.getString(2), rs.getString(3));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(rs, pstmt, conn);
		}
		return list;

	}
	
	public boolean ispassEquals(String pass){
		String sql = "select count(*) count from tt where SHAPass = ?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t1.endcoding(pass));
			rs = pstmt.executeQuery();
			System.out.println(t1.endcoding(pass));
			if(rs.next()){
				if(rs.getInt(1) == 1) result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(rs, pstmt, conn);
		}
		return result;
	}

}
