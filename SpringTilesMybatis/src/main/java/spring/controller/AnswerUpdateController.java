package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import spring.dao.BbsAnswerDao;

@Controller
public class AnswerUpdateController {
	
	@Autowired
	BbsAnswerDao bdao;

}
