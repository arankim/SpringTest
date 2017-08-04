package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import db.dto.ReplyDto;
import db.oracle.OracleConnect;

public class ReplyDao {
	OracleConnect db = new OracleConnect();

	// 총갯수
	public int getTotalCount() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from replybbs";
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;

	}

	// number의 max값 리턴(단 null값일 경우 0)
	public int getMaxNum() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select nvl(max(num),0) from replybbs";
		int maxNum = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return maxNum;
	}

	// 같은 그룹중 re_step이 전달받은 값보다 크면 무조건 re_step 1 증가함
	public void updateRe_step(int ref, int re_step) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update replybbs set re_step= re_step+1 where ref=? and re_step>?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// insert-num이 널일 경우 0이 들어있음(즉 num이 0이 들어있으면 새글)
	public int insertReply(ReplyDto dto) {
		// 원글이면 ref는 새로 구해야 하고,
		// re_step, re_level은 0으로
		// 답글일경우 증가..

		int n = 0;
		int ref, re_step, re_level;
		if (dto.getNum() == 0) { // 원글인경우
			ref = this.getMaxNum() + 1;
			re_step = 0;
			re_level = 0;

		} else { // 답글인 경우
			ref = dto.getRef();
			this.updateRe_step(dto.getRef(), dto.getRe_step()); // 같은 그룹중 전달받은
																// re_step보다 큰
																// 데이터는 모두 1증가함.
																// (같은 그룹들중에 이미
																// 디비에 등록된 값들을
																// 먼저 증가시킴!!!!)

			// 비로소 1씩 증가함.(지금 추가할려는 글의 값들임)
			re_step = dto.getRe_step() + 1;
			re_level = dto.getRe_level() + 1;
		}
		dto.setRef(ref);
		dto.setRe_step(re_step);
		dto.setRe_level(re_level);

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into replybbs values(seqjsp.nextval,?,?,?,0,?,?,?,sysdate)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getRef());
			pstmt.setInt(5, dto.getRe_step());
			pstmt.setInt(6, dto.getRe_level());
			pstmt.execute();
			n = dto.getNum();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return n;

	}

	// 페이징에 필요한 데이터 얻기
	public Vector<ReplyDto> getList(int start, int end) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.* from (select rownum as RNUM, b.* from (select * from replybbs c order by ref desc, re_step asc)b)a where a.RNUM between ? and ?";
		Vector<ReplyDto> list = new Vector<>();
		ReplyDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new ReplyDto(rs.getInt("num"), rs.getString("writer"), rs.getString("subject"),
						rs.getString("content"), rs.getInt("readcount"), rs.getInt("ref"), rs.getInt("re_step"),
						rs.getInt("re_level"), rs.getTimestamp("writeday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return list;
	}

	// num에 해당하는 데이타 얻기
	public ReplyDto getData(int num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from replybbs where num = ?";
		ReplyDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ReplyDto(rs.getInt("num"), rs.getString("writer"), rs.getString("subject"),
						rs.getString("content"), rs.getInt("readcount"), rs.getInt("ref"), rs.getInt("re_step"),
						rs.getInt("re_level"), rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;

	}

	public void updateReadCount(int num) {
		String sql = "update replybbs set readcount=readcount+1" + " where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

}
