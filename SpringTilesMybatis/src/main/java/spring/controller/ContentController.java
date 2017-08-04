package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.BbsAnswerDao;
import spring.dto.BbsAnswerDto;

@Controller
public class ContentController {
	
	@Autowired
	BbsAnswerDao badao;
	
	@RequestMapping(value="/board/answerread.do", method=RequestMethod.POST)
	public String insertAnswer(@RequestParam String nickname,
			@RequestParam String content,
			@RequestParam int num,
			@RequestParam String pageNum){
		
		BbsAnswerDto badto = new BbsAnswerDto(num, nickname, content);
		badao.insertBbsAnswer(badto); //댓글 삽입
		return "redirect:content.do?num="+badto.getNum()+"&pageNum="+pageNum;
	
	}
		

}
