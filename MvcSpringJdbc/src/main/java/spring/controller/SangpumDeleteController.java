package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.SangpumDao;

@Controller
public class SangpumDeleteController {

	@Autowired
	SangpumDao dao;

	@RequestMapping(value = "/sangpum/delete.do")
	public String delete(@RequestParam int num) {
		dao.deleteSangpum(num);
		return "redirect:list.do";
	}

}
