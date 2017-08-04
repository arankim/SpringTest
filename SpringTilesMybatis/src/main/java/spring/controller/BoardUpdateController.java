package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.ReplyDao;
import spring.dto.BbsAnswerDto;
import spring.dto.ReplyDto;

@Controller
public class BoardUpdateController {
	
	@Autowired
	ReplyDao dao;
	
	@RequestMapping("/board/updatedialog.do")
	public ModelAndView updatedialogform(@RequestParam int num){
		ModelAndView model = new ModelAndView();
		ReplyDto dto = dao.getData(num);
		
		model.addObject("dto",dto);
		model.setViewName("/pop/board/updatedialog");
		return model;
	}
	
	@RequestMapping("/board/bbsupdate.do")
	public String update(@RequestParam String writer, @RequestParam String pageNum,
			@RequestParam int num,
			@RequestParam String content,
	@RequestParam String subject
			){
		
		ReplyDto rdto = null;
		rdto = new ReplyDto(num,writer,subject,content);
		
		dao.updateBoard(rdto);
		return "redirect:content.do?num="+rdto.getNum()+"&pageNum="+pageNum;
		
	}

}
