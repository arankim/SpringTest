package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.model.SangpumDao;
import spring.model.SangpumDto;

@Controller
public class SangpumListController {
	
	@Autowired
	SangpumDao dao;
	
	@RequestMapping(value="/sangpum/list.do")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		List<SangpumDto> list = dao.getAllDatas();
		model.addObject("list",list);
		model.addObject("count",list.size());
		model.setViewName("sangpum/list");
		
		return model;
	}

}
