package spring.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping("/list3.do")
	public String hello() {
		return "redirect:list2.do";
	}

	@RequestMapping("/start")
	public String happy(){
		return "hello/start";
	}
	
	//배열형태 : 여러가지의 매핑주소에 대하여 같은 곳으로 포워딩 하는 것
	@RequestMapping({"write.do","update.do"})
	public String nice(){
		return "hello/result";
	}
}
