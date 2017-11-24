package project.dimigo.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.service.UserService;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import project.dimiog.user.DiaryList;

public class GetAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title2");
		System.out.println(title);
		List<DiaryList> list = new ArrayList();
		UserService service = new UserService();
		list = service.getDiary(list);
		for(DiaryList d : list) {
			if(d.getTitle().equals(title)) {
				System.out.println("find");
				request.setAttribute("text", d.getText());
				System.out.println(d.getText());
				RequestDispatcher rd = request.getRequestDispatcher("diary.jsp");
				rd.forward(request, response);
				break;
			}
		}
	}

}
