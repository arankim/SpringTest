package spring.pack;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


/*
 * @SessionAttributes
 * 1. 몇단계에 걸쳐서 완성되는 폼을 구성하고 싶을때
 * 지속적으로 사용자의 입력 값을 유지하고 싶을때
 */
@Controller
@SessionAttributes("id")
public class SessionController {
	
	@RequestMapping("/form1.do")
	public String form1(){
		return "login/loginform1";
	}
	
	@RequestMapping("/form2.do")
	public String form2(){
		return "login/loginform2";
	}

	@RequestMapping(value="/loginproc1.do", method=RequestMethod.POST)
	public ModelAndView proc1(@RequestParam String id, @RequestParam String pass){
		ModelAndView model = new ModelAndView();
		model.addObject("id",id);
		model.setViewName("login/result");
		return model;
	}
	
	@RequestMapping("/sessionclear.do")
	public String sessionClear(SessionStatus status){
		status.setComplete(); //세션제거
		return "login/resultclear";
	}
	
	public ModelAndView proc2(
			@RequestParam String id,
			@RequestParam String pass,
			HttpSession session
			)
	{
		ModelAndView model = new ModelAndView();
		
		//세션에 id저장
		session.setAttribute("id", id);
		
		model.addObject("id",id);
		model.setViewName("login/result");
		return model;
	}
}

