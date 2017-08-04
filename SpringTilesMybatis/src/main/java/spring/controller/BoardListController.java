package spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.BbsAnswerDao;
import spring.dao.ReplyDao;
import spring.dto.BbsAnswerDto;
import spring.dto.ReplyDto;

@Controller
public class BoardListController {
	
	@Autowired
	private ReplyDao dao;
	
	@Autowired
	private BbsAnswerDao adao;
	
	@RequestMapping("/board/list.do")
	public ModelAndView form( @RequestParam(value = "pageNum", defaultValue = "1") int pageNum ){
		ModelAndView model = new ModelAndView();
		//페이징 처리에 필요한 변수들	
		int totalCount=dao.getTotalCount(); //총 글의 갯수
		int perPage=5; //한페이지당 보여지는 글의 갯수
		int perBlock=5; //한블럭당 보여지는 페이지번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호
		Map<Integer,Integer> map = new HashMap<>(); //각 리스트에 들어갈 댓글갯수
		
		//총 페이지수
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum=(pageNum-1)*perPage+1;
		endNum=startNum+perPage-1;
		//예를 들어 모두 45개의 글이 있을경우
		  //마지막 페이지는 endnum 이 45 가 되야함
		  if(endNum>totalCount)
				endNum=totalCount;
		
		//각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
		startPage= (pageNum-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		//예를 들어 총 34페이지일경우
		//마지막 블럭은 30-34 만 보여야함
		if(endPage>totalPage)
		   endPage=totalPage;
		
		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no=totalCount-((pageNum-1)*perPage);
		
		//디비에서 목록 가져오기.
		List<ReplyDto> list=dao.getList(startNum, endNum);
		
		//리스트에 댓글갯수 구하기.
		for(int i = 0; i<list.size(); i++){
		map.put(list.get(i).getNum(), adao.getCountOfNum(list.get(i).getNum()));
		}


		model.addObject("totalCount",totalCount);
		model.addObject("list",list);
		model.addObject("no",no);
		model.addObject("startPage",startPage);
		model.addObject("endPage",endPage);
		model.addObject("totalPage",totalPage);
		model.addObject("pageNum",pageNum);
		model.addObject("map",map);
		model.setViewName("/3/board/list");
		return model;
	}
	
	@RequestMapping("/board/alist.do")
	public ModelAndView answerlist(
			@RequestParam int num){
		ModelAndView model = new ModelAndView();
		List<BbsAnswerDto> alist = adao.getAnswerListOfNum(num);
		model.addObject("alist",alist);
		model.setViewName("/pop/board/answerlist");
		return model;
	}

}
