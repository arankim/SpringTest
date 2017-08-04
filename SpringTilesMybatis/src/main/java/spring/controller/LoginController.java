package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.MemberDao;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDao dao;
	
	@RequestMapping("/login/loginmain.do")
	public ModelAndView login_main(HttpSession session){
		ModelAndView model = new ModelAndView();
		String id = (String)session.getAttribute("idok");
		String save = (String)session.getAttribute("saveok");
		String login = (String)session.getAttribute("loginok");
		
		if(login == null){
			if(save == null || save.equals("no"))
				id="";
			model.addObject("id",id);
			model.addObject("save",save==null?"no":save);
			model.setViewName("/3/login/loginform");
		} else {
			String name=dao.getName(id);
			model.addObject("id",id);
			model.addObject("name",name);
			model.setViewName("/3/login/logoutform");
		}
		return model;
	}
	
	@RequestMapping("/login/loginaction.do")
	public String login(@RequestParam String id, @RequestParam(value="idsave", defaultValue="no") String idsave,
			@RequestParam String pass, HttpSession session){
		boolean login = dao.isLogin(id, pass);
		
		if(!login){ //로그인 실패시
			return "/3/login/loginfail";
		}
		
		//세션에 저장
		session.setAttribute("idok", id);
		session.setAttribute("saveok", idsave);
		session.setAttribute("loginok", "yes");
		session.setMaxInactiveInterval(60*60*8);
				
		return "redirect:loginmain.do";
	}
	
	@RequestMapping("/login/logoutaction.do")
	public String logout(HttpSession session){
		session.removeAttribute("loginok");
		return "redirect:loginmain.do";
	}
	
	
}
