package spring.upload;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	@RequestMapping("/uploadform1.do")
	public String form1() {
		return "upload/uploadform1";
	}

	@RequestMapping("/uploadform2.do")
	public String form2() {
		return "upload/uploadform2";
	}

	@RequestMapping(value = "/uploadproc.do", method = RequestMethod.POST)
	public ModelAndView dataread(@RequestParam String msg, @RequestParam MultipartFile myimage,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();

		// 저장할 save의 실제경로 구하기
		String path = request.getSession().getServletContext().getRealPath("\\save");
		System.out.println(path);

		// 이미지명
		String imageName = myimage.getOriginalFilename();

		// 이미지저장
		SpringFileWriter writer = new SpringFileWriter();
		writer.writeOneFile(myimage, path);

		model.addObject("imagename", imageName);
		model.addObject("msg", msg);

		// 포워드
		model.setViewName("upload/result1");
		return model;
	}

	@RequestMapping(value = "/uploadproc2.do", method = RequestMethod.POST)
	public ModelAndView dataread2(@ModelAttribute UploadDto dto, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();

		// 저장할 save의 실제경로 구하기
		String path = request.getSession().getServletContext().getRealPath("\\save");
		System.out.println(path);

		// jsp로 보냉 이미지이름들 저장할 변수
		String imageNames = "";

		if (dto.getUpfile() == null) {
			imageNames = "no";
		} else {

			for (MultipartFile file : dto.getUpfile()) {
				if (file.getOriginalFilename().equals("")) {
					imageNames = "no";
					break;
				}
				System.out.println("file:" + file.getOriginalFilename());
				imageNames += file.getOriginalFilename()+",";
			}
			
		}

		//마지막 컴마 제거
		if(!imageNames.equals("no")){
			//이미지를 save폴더에 저장
			SpringFileWriter writer = new SpringFileWriter();
			writer.writeMultiFile(dto.getUpfile(), path);
			imageNames = imageNames.substring(0,imageNames.length()-1);
		}
		model.addObject("myimage",imageNames);
		model.addObject("msg",dto.getMsg());
		model.setViewName("upload/result2");
		return model;
	}

}
