package spring.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping("/login.do")
	public String loginformgo(){
		return "login/login";
	}
	
	@RequestMapping(value="/loginaction.do", method=RequestMethod.GET)
	public ModelAndView loginconfirm(
			@RequestParam String id,
			@RequestParam("password") int pw
			){
		ModelAndView model = new ModelAndView();
		
		if(id.equals("admin") & pw== 1234){
			model.setViewName("login/success");
		} else {
			model.addObject("id", id);
			model.setViewName("login/fail");
		}
		
		return model;	
	}

}
