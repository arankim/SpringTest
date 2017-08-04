package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import db.dto.UploadDto;
import db.oracle.OracleConnect;

public class UploadDao {
	OracleConnect db = new OracleConnect();
	public int getTotalCount(){
		int n = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from uploadbbs";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				n = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	}
	
	public Vector<UploadDto> getSangpums(int start, int end){
		Vector<UploadDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UploadDto dto = null;
		String sql = "select * from (select rownum as r, c.* from uploadbbs c) where r between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new UploadDto(rs.getInt("num"), rs.getString("id"), rs.getString("subject"), rs.getString("content"), rs.getString("filename"), rs.getInt("readcount"),
						rs.getTimestamp("writeday"));
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

	public void insertUpload(UploadDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into uploadbbs values(seqjsp.nextval, ?, ?, ?, ?,sysdate,0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFilename());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(pstmt, conn);
		}
	}
	
	//조회수증가
	public void updateReadCount(int num){
		String sql = "update uploadbbs set readcount = readcount+1 where num = ?";
		Connection conn =db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(pstmt, conn);
		}
	}
	
	//번호에 해당하는 데이타 가져오기
	public UploadDto getData(int num){
		UploadDto dto = null;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from uploadbbs where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new UploadDto(rs.getInt("num"),rs.getString("id"),rs.getString("subject"), rs.getString("content"),rs.getString("filename"),rs.getInt("readcount"),rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public void deleteSangpum(int num){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from uploadbbs where num = ?";
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
