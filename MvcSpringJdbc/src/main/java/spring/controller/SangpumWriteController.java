package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import spring.model.SangpumDao;
import spring.model.SangpumDto;

@Controller
public class SangpumWriteController {
	
	@Autowired
	SangpumDao dao;
	
	@RequestMapping(value="/sangpum/writeform.do")
	public String writeformgo(){
		return "sangpum/writeform";
	}
	
	@RequestMapping(value="/sangpum/writeproc.do", method=RequestMethod.POST)
	public String write(@ModelAttribute("sangpumDto") SangpumDto dto){
		dao.insertSangpum(dto);
		return "redirect:list.do";
	}

}
