package spring.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;


import spring.dto.BbsAnswerDto;

public class BbsAnswerDao extends SqlSessionDaoSupport {
	
	public void insertBbsAnswer(BbsAnswerDto badto) {
		getSqlSession().insert("insertOfBbsAnswer", badto);
	}

	public List<BbsAnswerDto> getAnswerListOfNum(int num) {
		List<BbsAnswerDto> list = null;
		list = getSqlSession().selectList("selectNumOfBbsAnswer", num);
		return list;
	}

	public int getCountOfNum(int num) {
		int count = 0;
		count = getSqlSession().selectOne("countOfBbsAnswer", num);
		return count;
	}

	public void deleteByNum(int num) {
		// TODO Auto-generated method stub
		
	}

	public void deleteByPk(int pk) {
		// TODO Auto-generated method stub
		
	}

/*	public void deleteByNum(int num) {
		getSqlSession().delete("deletebyPkOfAnswer",num);
		
	}
*/
}
