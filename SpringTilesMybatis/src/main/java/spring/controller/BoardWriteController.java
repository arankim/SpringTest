package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javafx.beans.DefaultProperty;
import spring.dao.ReplyDao;
import spring.dto.ReplyDto;

@Controller
public class BoardWriteController {
	@Autowired
	ReplyDao dao;

	@RequestMapping("/board/writeform.do")
	public ModelAndView form(@RequestParam(value = "num", defaultValue = "0") int num,
			                 @RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {
		ModelAndView model = new ModelAndView();
		model.addObject("pageNum", pageNum);
		model.addObject("num",num);
		
		//답글일 경우에는 기존글의 제목을 보낸다.
		String subject = "";
		
		if(num!=0) { //답글일 경우
			subject = "[답글]"+dao.getData(num).getSubject();
		} 
		model.addObject("subject",subject);
		model.setViewName("/3/board/writeform");
		return model;
	}
	
	@RequestMapping(value="/board/writeproc.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute ReplyDto dto, @RequestParam String pageNum){
		int num = dao.insertReply(dto);
		return "redirect:content.do?num="+num+"&pageNum="+pageNum;
		
	}
	

}
