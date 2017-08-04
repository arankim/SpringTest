package spring.pack;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller //상속받을거 아닌 이상은 꼭 이렇게 컨트롤러를 넣어줘야 한다~
public class ListController {
	
	@RequestMapping("/list1.do")
	public ModelAndView my() {
		ModelAndView model = new ModelAndView();
		model.addObject("msg", "Happy day");
		model.addObject("day", new Date());
		model.setViewName("hello/list1");
		return model;
	}
	
	@RequestMapping("/list2.do")
	public String list(Model model){
		model.addAttribute("imgname","image/01.png");
		return "hello/list2";
	}
	
}
