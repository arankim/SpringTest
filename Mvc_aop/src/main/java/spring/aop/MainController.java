package spring.aop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@Autowired
	MyModel model;
	
	@RequestMapping("/start.do")
	public ModelAndView start(){
		String result = model.processMsg();
		ModelAndView model = new ModelAndView();
		model.addObject("data",result);
		model.setViewName("result");
		return model;
	}

}
