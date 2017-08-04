package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.model.SangpumDao;
import spring.model.SangpumDto;


@Controller
public class SangpumUpdateController {
	
	@Autowired
	SangpumDao dao;
	
	@RequestMapping(value="/sangpum/updateform.do")
	public ModelAndView updateformgo(@ModelAttribute("dto") SangpumDto dto
			){
		ModelAndView model = new ModelAndView();
		dto = dao.getData(dto.getNum());
		model.addObject("dto", dto);
		model.setViewName("sangpum/updateform");
		return model;
	}
	
	@RequestMapping(value="/sangpum/update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute("dto") SangpumDto dto){
		dao.updateSangpum(dto);
		return "redirect:list.do";
	}

}
