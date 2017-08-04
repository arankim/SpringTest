package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import db.dto.MemberDto;
import db.dto.ZipcodeDto;
import db.oracle.OracleConnect;

public class MemberDao {
	OracleConnect db = new OracleConnect();

	public boolean isEqualId(String id) {
		String sql = "select count(id) count from member where id = ?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getInt("count") == 1) {
					result = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return result;
	}

	public Vector<ZipcodeDto> getsearchDong(String dong) {
		Vector<ZipcodeDto> list = new Vector<>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ZipcodeDto dto = null;

		String sql = "select zipcode, sido, gugun, nvl(dong,' ') as dong , nvl(ri,' ') as ri , nvl(bunji,' ') as bunji from zipcode where dong like ? or ri like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + dong + "%");
			pstmt.setString(2, "%" + dong + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new ZipcodeDto(rs.getString("zipcode").trim(), rs.getString("sido").trim(),
						rs.getString("gugun").trim(), rs.getString("dong").trim(), rs.getString("ri").trim(),
						rs.getString("bunji").trim());
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

	public void insertMember(MemberDto dto) {
		String sql = "insert into member(num, name, id, pass,hp,birth,address,email,gaipday) values(seq_count.nextval,?,?,?,?,?,?,?,sysdate)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getAddress());
			pstmt.setString(7, dto.getEmail());
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// 아이디가 있으나 비번이 맞지 않으면 2
	// 아이디가 없으면 3
	// 아이디와 비번이 모두 맞으면 1을 리턴

	public int getLoginStatus(String id, String pass) {
		int n = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id , pass from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("id").equals(id) && rs.getString("pass").equals(pass)) {
					n = 2;
				} else if (!rs.getString("id").equals("id")) {
					n = 3;
				} else if (rs.getString("id").equals(id) && !rs.getString("pass").equals(pass)) {
					n = 1;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	}

	public String getName(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select name from member where id = ?";
		String name = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return name;
	}
	
	public Vector<MemberDto> getAllList(){
		Vector<MemberDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		String sql = "select * from member order by num";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new MemberDto(rs.getString("num"),rs.getString("name"), rs.getString("id"), rs.getString("pass"), rs.getString("address"), rs.getString("email"), 
						rs.getString("hp"), rs.getTimestamp("gaipday"),rs.getString("birth"));
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
	
	public void deleteMember(String num){
		String sql = "delete from member where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

}
