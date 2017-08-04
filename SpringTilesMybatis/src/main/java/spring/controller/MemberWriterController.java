package spring.controller;

import java.util.Calendar;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.MemberDao;
import spring.dto.MemberDto;

@Controller
public class MemberWriterController {
	
	@Autowired
	MemberDao dao;
	
	@RequestMapping("/member/memberform.do")
	public ModelAndView form(){
		
		ModelAndView model = new ModelAndView();
		
		/*Vector<String> hp = new Vector<>();
		hp.add("010");*/
		String hp = "010,011,016,017,018,018";

		
		Calendar cal = Calendar.getInstance();
		
		model.addObject("year",cal.get(Calendar.YEAR));
		model.addObject("year",cal.get(Calendar.MONTH)+1);
		model.addObject("year",cal.get(Calendar.DATE));
		model.addObject("hp",hp);
		model.setViewName("/3/member/memberform");
		return model;
	}
	
	@RequestMapping("/member/idsearch.do")
	public ModelAndView idsearch(@RequestParam String id,
			@RequestParam(value="key", defaultValue="form") String key){
		//null일때는 equals가 안먹기 때문에 임의로 form이라는 디폴트값을 넣어준거임!
		//form일때는 id서치를 안해두 되고 그 외에 경우에는 무조건 id를 찾아야한다.
		
		ModelAndView model = new ModelAndView();
		
		return model;
	}
	
	@RequestMapping(value="/member/memprocess.do", method = RequestMethod.POST)
	public ModelAndView member_insert(@ModelAttribute("mem") MemberDto dto){
		ModelAndView model = new ModelAndView();
		String hp = dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3();
		dto.setHp(hp);
		
		String email = dto.getEmail1()+"@"+dto.getEmail2();
		dto.setEmail(email);
		
		String birth = dto.getYear()+"-"+dto.getMonth()+"-"+dto.getDay();
		dto.setBirth(birth);
		
		dao.insertMember(dto);
		
		model.setViewName("redirect:sucess.do?id="+dto.getId());
		return model;
	}
	
	@RequestMapping(value="/member/success.do")
	public ModelAndView sucess(@RequestParam String id){
		return new ModelAndView("/3/member/sucesspage","id",id);
	}
}
