package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class MovieDao {
	OracleConnect db = new OracleConnect();

	public String getseatList(String num) {
		String data = "";
		String sql="select * from movietb where no="+num;
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if (rs.next()){
				data = rs.getString("seat");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return data;
	}
	
public void insertSeat(String num,String myseat,String mymovie){
	Connection conn = db.getConnection();
	Statement stmt  = null;
	ResultSet rs = null;
	String sql="select * from movietb where no="+num;
		
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			String seat=rs.getString("seat");
			seat+=","+myseat;
			sql="update movietb set seat='"+seat+"' where no="+num;
			stmt.execute(sql);

		} else {
			sql="insert into movietb values ("+num+",'"+mymovie
					+"','"+myseat+"')";
			stmt.execute(sql);	

		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		db.dbClose(rs, stmt, conn);
	}
	
}

}
