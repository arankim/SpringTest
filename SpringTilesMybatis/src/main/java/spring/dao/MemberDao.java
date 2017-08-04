package spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.dto.MemberDto;

public class MemberDao extends SqlSessionDaoSupport{

	public boolean isSearchId(String id){
		int n = getSqlSession().selectOne("idSearchOfMember",id);
		return n == 1?true:false;
	}
	
	public void insertMember(MemberDto dto){
		getSqlSession().insert("insertOfMember",dto);
	}
	
	public boolean isLogin(String id, String pass){
		boolean flag = false;
		int count;
		Map<String,String> hmap = new HashMap<>();
		hmap.put("id", id);
		hmap.put("pass",pass);
		
		count = getSqlSession().selectOne("loginEqualIdPassOfMember", hmap);
		
		if(count == 1){
			flag = true;
		}
		
		return flag;
	}

	public String getName(String id) {
		return getSqlSession().selectOne("selectNameOfMember", id);
	}
	
}