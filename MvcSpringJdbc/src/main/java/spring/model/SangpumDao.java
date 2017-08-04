package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class SangpumDao extends JdbcDaoSupport {
	static final String LIST_SQL = "select * from sangpum order by num asc";
	static final String INSERT_SQL = "insert into sangpum values(seqjsp.nextval,?,?,?)";
	static final String SELECT_ONE_SQL = "select * from sangpum where num=?";
	static final String UPDATE_SQL = "update sangpum set sang=?, su=?, dan=? where num=?";
	static final String DELETE_SQL = "delete from sangpum where num=?";
	
	//데이타 가져오는 메소드(내부클래스)
	class SangpumRowMapper implements RowMapper<SangpumDto>{
		@Override
		public SangpumDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			SangpumDto dto = new SangpumDto();
			dto.setNum(rs.getInt("num"));
			dto.setSang(rs.getString("sang"));
			dto.setSu(rs.getInt("su"));
			dto.setDan(rs.getInt("dan"));
			return dto;
		}
		
	}
	
	public List<SangpumDto> getAllDatas(){
		List<SangpumDto> list = getJdbcTemplate().query(LIST_SQL, new SangpumRowMapper());
		return list;
	}
	
	public void insertSangpum(SangpumDto dto){
		getJdbcTemplate().update(INSERT_SQL, new Object[]{dto.getSang(), dto.getSu(), dto.getDan()}); //insert, update, delete는 다 update()메소드 사용
	}
	
	public SangpumDto getData(int num){
		SangpumDto dto = null;
		dto = getJdbcTemplate().queryForObject(SELECT_ONE_SQL, new Object[]{num},new SangpumRowMapper());
		return dto;
	}
	
	public void updateSangpum(SangpumDto dto){
		getJdbcTemplate().update(UPDATE_SQL,new Object[]{dto.getSang(), dto.getSu(), dto.getDan(), dto.getNum()});
	}
	
	public void deleteSangpum(int num){
		getJdbcTemplate().update(DELETE_SQL,new Object[]{num});
	}
	
	
	
	

}
