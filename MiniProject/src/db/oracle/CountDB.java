package db.oracle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class CountDB {
	OracleConnect db = new OracleConnect();
	
	//카운트를 1 증가한 값을 반환하는 메소드
	public int getCount(){
		int cnt = 0;
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql  =  "update countdb set num = seq_count.nextval";
		try{
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			sql = "select num from countdb";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				cnt = rs.getInt("num");
			}
		} catch( SQLException e){
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
		return cnt;
	}
}
