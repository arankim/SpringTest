package homework;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import db.GuestDto;
import db.OracleConnect;

public class HomeworkDao {
	OracleConnect db = new OracleConnect();
	
	public void insertGuest(String content){
		String sql = "insert into homeworkchat values(?,sysdate,seqjsp.nextval,0)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public Vector<HomeworkDto> getAllGuest(String content){
		Vector<HomeworkDto> list = new  Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		HomeworkDto dto = null;
		String sql = "select * from homeworkchat where content = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,content);
			rs = pstmt.executeQuery();
			while(rs.next()){
			dto = new HomeworkDto(rs.getString("content"),rs.getTimestamp("writeday"));
			list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public void updateChuNumber(String like,int num){
		String sql = "";
		
		if(like.equals("1")){
	    sql = "update homeworkchat set chu=chu+1 where num=?";
		} else {
			sql = "update homeworkchat set chu=chu-1 where num=?";
		}
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(pstmt, conn);
		}
	}
	
}
