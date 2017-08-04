package spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.dto.ReplyDto;

public class ReplyDao extends SqlSessionDaoSupport {
	public int getTotalCount() {
		return getSqlSession().selectOne("totalCountOfReply");

	}

	// num의 최대값 구하기
	public int getMaxNum() {
		return getSqlSession().selectOne("maxNumOfReply");
	}

	public void updateRestep(int ref, int re_step) {
		Map<String, Integer> map = new HashMap<>();
		map.put("ref", ref);
		map.put("re_step", re_step);
		getSqlSession().update("updateRestepOfreply", map);
	}

	public int getSequence() {
		return getSqlSession().selectOne("getSeqOfReply");

	}

	public ReplyDto getData(int num) {
		return getSqlSession().selectOne("selectOneOfReply", num);
	}

	public int insertReply(ReplyDto dto) {
		int num, ref, re_step, re_level;
		num = dto.getNum();
		
		if (num == 0) { // 원글

			ref = this.getMaxNum() + 1;
			re_step = re_level = 0;

		} else { // 답글
			
			ReplyDto sdto = this.getData(num);
			ref = sdto.getRef();
			re_step = sdto.getRe_step();
			re_level = sdto.getRe_level();
			
			// 기존의 re_step증가
			this.updateRestep(ref, re_step);

			// 추가할 step, level 1증가
			re_step++;
			re_level++;
		}

		// insert할 때 들어갈 시퀀스
		int seq = this.getSequence();
		dto.setNum(seq);
		dto.setRef(ref);
		dto.setRe_step(re_step);
		dto.setRe_level(re_level);

		getSqlSession().insert("insertOfReply", dto);
		return seq;
	}
	
	public void updateReadcount(int num){
		getSqlSession().update("updateReadCountOfReply",num);
	}
	
	public List<ReplyDto> getList(int start, int end){
		List<ReplyDto> list = null;
		Map<String,Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		list = getSqlSession().selectList("selectListOfBoard", map);
		return list;
		
	}
	
	public void updateBoard(ReplyDto dto){
		getSqlSession().update("boardUpdateOfReply",dto);
	}

	public void deleteReply(int num) {
		// TODO Auto-generated method stub
		
	}
	
	/*public void deleteReply(int num){
		getSqlSession().delete("deletebyNumOfAnswer",num);
	}*/
}
