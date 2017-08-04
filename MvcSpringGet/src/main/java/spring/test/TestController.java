package spring.test;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class TestController {
	@RequestMapping("/testform1.do")
	public ModelAndView testform1go(){
		ModelAndView model = new ModelAndView();
		model.setViewName("form/testform1");
		return model;
	}
	
	@RequestMapping("/testform2.do")
	public String testform2go(){
		return "form/testform2";
	}
	
	@RequestMapping("/testform3.do")
	public String testform3go(){
		return "form/testform3";
	}
	
	//각 각 읽는 방법
	@RequestMapping(value="/result1.do", method=RequestMethod.GET)
	public ModelAndView disp(
			@RequestParam String name, @RequestParam("age") int nai, @RequestParam String addr, 
			@RequestParam(value="pageNum",defaultValue="1") int currentPage
			){
		ModelAndView model = new ModelAndView();
		model.addObject("age", nai);
		model.addObject("name",name);
		model.addObject("addr",addr);
		model.addObject("pageNum",currentPage);
		model.setViewName("form/result1");
		return model;
	}
	
	//DTO로 읽는방법
	@RequestMapping(value="/result2.do", method=RequestMethod.POST)
	public ModelAndView disp2(@ModelAttribute("my") TestDto dto){
		ModelAndView model = new ModelAndView();
		model.addObject("dto",dto);
		model.setViewName("form/result2");
		return model;
	}
	
	@RequestMapping(value="/result3.do", method=RequestMethod.POST)
	public ModelAndView disp3(@RequestParam Map<String, String> map){
		ModelAndView model = new ModelAndView();
		model.addObject("name",map.get("name"));
		model.addObject("age",map.get("age"));
		model.addObject("addr",map.get("addr"));
		model.setViewName("form/result3");
		return model;
	}
}

