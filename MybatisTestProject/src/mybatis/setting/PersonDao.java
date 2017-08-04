package mybatis.setting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class PersonDao {
	
	ConnectionManager connectionManager = ConnectionManager.getInstance();
	SqlSession session;

	private SqlSession getSession() {
		session = connectionManager.openSession();
		return session;
	}
	
	public int getTotalCount(){
		session = getSession();
		int n = session.selectOne("totalCountOfPerson");
		session.close();
		return n;
	}
	
	public void insertPerson(PersonDto dto){
		session = getSession();
		session.insert("insertOfPerson",dto);
		session.close();
	}
	
	public List<PersonDto> getAllDatas(){
		session = getSession();
		List<PersonDto> list = session.selectList("selectAllDatasOfPerson");
		session.close();
		return list;
	}
}
