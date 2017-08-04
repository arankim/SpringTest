package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import db.dto.AnswerDto;
import db.dto.AnswerUploadDto;
import db.oracle.OracleConnect;

public class AnswerUploadDao {
	OracleConnect db = new OracleConnect();

	public void insertAnswerUpload(AnswerUploadDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into answeruploadbbs values(seqjsp.nextval,?,?,?,?,sysdate,0)";
		System.out.println(dto.getNum());
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			db.dbClose(pstmt, conn);
		}
	}

	public int getAnswerCount(int num) {
		String sql = "select count(*) from answeruploadbbs where num=?";
		int n = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				n = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	}
	
	public Vector<AnswerUploadDto> getAnswerList(int num) {
		Vector<AnswerUploadDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 AnswerUploadDto dto = null;
		String sql = "select * from answeruploadbbs where num = ? order by pk desc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new AnswerUploadDto(rs.getInt("num"), rs.getInt("pk"), rs.getString("name"), rs.getString("id"),
						rs.getString("content"), rs.getTimestamp("sdate"),rs.getInt("readcount"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//조회수 증가
		public void updateReadCount(int num)
		{
			String sql="update answeruploadbbs set readcount=readcount+1 where num=?";
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,num);			
				pstmt.execute();			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}	
		}

}
