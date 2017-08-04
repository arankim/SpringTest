package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.BbsAnswerDao;
import spring.dao.ReplyDao;

@Controller
public class BoardDeleteController {
	@Autowired
	private ReplyDao rdao;

	@Autowired
	private BbsAnswerDao adao;

	//원글 삭제
	@RequestMapping("/board/delete.do")
	public String delete(
			@RequestParam int num,
			@RequestParam String pageNum
			)
	{
		//현재 글에 달린 댓글부터 먼저 삭제
		adao.deleteByNum(num);
		//원글 삭제
		rdao.deleteReply(num);
		//목록으로 이동
		return "redirect:list.do?pageNum="+pageNum;
	}

	//댓글 삭제
	@RequestMapping("/board/deleteanswer.do")
	public String delete_answer(
			@RequestParam int pk,
			@RequestParam int num,
			@RequestParam String pageNum
			)
	{
		//댓글 삭제
		adao.deleteByPk(pk);
		
		//내용보기로 이동
		return "redirect:content.do?num="+num+
				"&pageNum="+pageNum;
	}
}
