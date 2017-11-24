package project.dimigo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.service.UserService;

public class DeleteAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("value");
		System.out.println("삭제할 이름 : " + name);
		UserService service = new UserService();
		service.deleteCal(name);
		response.sendRedirect("cal.jsp");
	}

}
