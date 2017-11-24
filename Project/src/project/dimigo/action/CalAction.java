package project.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.service.UserService;

public class CalAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String text = request.getParameter("text");
		String date = request.getParameter("date");
		System.out.println(text + "\n" + date);
		UserService service = new UserService();
		service.insertCal(text, date);
		response.sendRedirect("cal.jsp");
	}

}
