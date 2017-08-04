package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.BbsAnswerDao;
import spring.dao.ReplyDao;
import spring.dto.BbsAnswerDto;
import spring.dto.ReplyDto;

@Controller
public class BoardContentController {
	
	@Autowired
	ReplyDao dao;
	
	@Autowired
	BbsAnswerDao aDao;
	
	@RequestMapping("/board/content.do")
	public ModelAndView process(
			/*목록에서 클릭시 readcount를 증가하기 위해서 key에 list를 보냄(내가 조회수 알고리즘을 만든거임) */
			@RequestParam int num,
			@RequestParam String pageNum,
			@RequestParam(value="key", defaultValue="no") String key){
		
		ModelAndView model = new ModelAndView();
		int answerCount = 0;
		
		//목록에서 들어온 경우 조회수 증가함
		if(key.equals("list")){
			dao.updateReadcount(num);
		}
		
		ReplyDto dto = dao.getData(num);
		
		//댓글 갯수 구하기(원래는 ContentControll에서 진행하려고 했지만 동시에 같은 .do를 선언할 수가 없어서 부득히 이 곳에 로직 넣음)
		answerCount = aDao.getCountOfNum(num);
		
		//댓글 리스트 구하기
		List<BbsAnswerDto> list = null;
		list = aDao.getAnswerListOfNum(num);
		
		model.addObject("list",list);
		model.addObject("dto",dto);
		model.addObject("num", num);
		model.addObject("pageNum", pageNum);
		model.addObject("answerCount",answerCount);
		
		model.setViewName("/3/board/content");
		return model;
	}

}
