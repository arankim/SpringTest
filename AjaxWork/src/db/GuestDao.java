package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class GuestDao {
	OracleConnect db = new OracleConnect();
	
	//전체 갯수 구하기
	public int getTotalCount(){
		int n = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select count(*) count from guest";
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				n = rs.getInt(1);
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	}
	
	public Vector<GuestDto> getAllGuest(){
		Vector<GuestDto> list = new  Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		GuestDto dto = null;
		String sql = "select * from guest";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
			dto = new GuestDto(rs.getInt("num"), rs.getString("name"), rs.getString("id"), rs.getString("pass"), rs.getString("content"), rs.getTimestamp("writeday"),rs.getInt("avata"));
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
	
	public void insertGuest(GuestDto dto){
		String sql = "insert into guest values(seqjsp.nextval,?,?,?,?,sysdate,?)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getAvata());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public String getNames(String id){
		String myname="";
		String sql = "select name from member where id = ?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				myname = rs.getString("name");
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return myname;
	}
	
	public Vector<GuestDto> getList(int start, int end){
		Vector<GuestDto> list = new Vector<>();
		GuestDto dto = null;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum as r, c.* from guest c) where r between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new GuestDto(rs.getInt("num"), rs.getString("name"), rs.getString("id"), rs.getString("pass"), rs.getString("content"), rs.getTimestamp("writeday"),rs.getInt("avata"));
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

	public void updateGuest(GuestDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update guest set content = ? , avata = ? where num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2,dto.getAvata());
			pstmt.setInt(3, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean isEqualPassGuest(int num, String pass){
		String sql = "select count(pass) count from guest where num = ? and pass = ?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean sw = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getInt("count") == 1){
					sw = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sw;
	}
	
	
	public GuestDto getData(int num){
		GuestDto dto = null;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from guest where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new GuestDto(rs.getInt("num"),rs.getString("name"),rs.getString("id"),rs.getString("pass"),rs.getString("content"),rs.getTimestamp("writeday"),rs.getInt("avata"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public void deleteGuest(int num){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from guest where num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(pstmt, conn);
		}
		
	}
}
