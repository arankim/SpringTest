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

	// �Ѱ���
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

	// number�� max�� ����(�� null���� ��� 0)
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

	// ���� �׷��� re_step�� ���޹��� ������ ũ�� ������ re_step 1 ������
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

	// insert-num�� ���� ��� 0�� �������(�� num�� 0�� ��������� ����)
	public int insertReply(ReplyDto dto) {
		// �����̸� ref�� ���� ���ؾ� �ϰ�,
		// re_step, re_level�� 0����
		// ����ϰ�� ����..

		int n = 0;
		int ref, re_step, re_level;
		if (dto.getNum() == 0) { // �����ΰ��
			ref = this.getMaxNum() + 1;
			re_step = 0;
			re_level = 0;

		} else { // ����� ���
			ref = dto.getRef();
			this.updateRe_step(dto.getRef(), dto.getRe_step()); // ���� �׷��� ���޹���
																// re_step���� ū
																// �����ʹ� ��� 1������.
																// (���� �׷���߿� �̹�
																// ��� ��ϵ� ������
																// ���� ������Ŵ!!!!)

			// ��μ� 1�� ������.(���� �߰��ҷ��� ���� ������)
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

	// ����¡�� �ʿ��� ������ ���
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

	// num�� �ش��ϴ� ����Ÿ ���
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
