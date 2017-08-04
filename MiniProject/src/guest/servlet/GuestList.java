package guest.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dao.GuestDao;
import db.dto.GuestDto;

import java.util.*;

@WebServlet("/guest/list.do")
public class GuestList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//resp.getWriter().append("Served at : ").append();
		GuestDao dao = new GuestDao();
		Vector<GuestDto> list = dao.getAllGuest();

		//request�� list���
		request.setAttribute("list", list);
		
		//����� jsp���Ϸ� ������
		RequestDispatcher rd = request.getRequestDispatcher("../day0720/guestlist.jsp");
		rd.forward(request,reponse);

	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
	
	

}
