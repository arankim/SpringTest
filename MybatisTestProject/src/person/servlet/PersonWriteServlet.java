package person.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.setting.PersonDao;
import mybatis.setting.PersonDto;


@WebServlet("/person/write.do")
public class PersonWriteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	PersonDto dto = new PersonDto(name,hp);
	
	PersonDao db = new PersonDao();
	db.insertPerson(dto);
	
	response.sendRedirect("list.do"); //db에 insert한 후 목록으로 이동하므로 redirect함.
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
