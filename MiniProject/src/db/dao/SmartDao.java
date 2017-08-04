package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import db.dto.SmartDto;
import db.oracle.OracleConnect;

public class SmartDao {
		OracleConnect db=new OracleConnect();

		public void insertSmartData(SmartDto dto)
		{
			String sql="insert into smartbbs values ("
					+ "seqjsp.nextval,?,?,?,0,sysdate)";
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.execute();			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}		
		}

		public int getTotalSmartCount()
		{
			int n=0;
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select count(*) from smartbbs";
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					n=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return n;
		}

		public Vector<SmartDto> getSmartDatas(int start,int end)
		{
			Vector<SmartDto> list=new Vector<>();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select a.* from (select ROWNUM as "
					+ "RNUM,b.* from (select * from smartbbs"
					+ " order by num desc)b)a where a.RNUM>=?"
					+ " and a.RNUM<=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					SmartDto dto=new SmartDto();
					dto.setNum(rs.getString("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setName(rs.getString("name"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}

		//조회수 증가
		public void updateReadCount(String num)
		{
			String sql="update smartbbs set readcount=readcount+1"
					+ " where num=?";
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,num);			
				pstmt.execute();			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}	
		}

		//번호에 해당하는 데이타 가져오기
		public SmartDto getData(String num)
		{
			SmartDto dto=new SmartDto();
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from smartbbs where num=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,num);			
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					dto.setNum(rs.getString("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setName(rs.getString("name"));;
					dto.setReadcount(rs.getInt("readcount"));
					dto.setWriteday(rs.getTimestamp("writeday"));				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return dto;
		}
}
