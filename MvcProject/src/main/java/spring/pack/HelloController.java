package spring.pack;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HelloController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView model = new ModelAndView();
		
		//request에 데이타를 담는다(포워드된 파일에서 사용할 변수)
		model.addObject("msg","HelloController로부터 포워드됨!");
		model.setViewName("result");
		return model;
	}

}
