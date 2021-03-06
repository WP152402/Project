package project.dimigo.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.service.UserService;

import project.dimiog.user.DiaryList;

public class ListAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DiaryList list = new DiaryList();
		request.setCharacterEncoding("utf-8");
		String diary = request.getParameter("diary");
		String title = request.getParameter("title");
		System.out.println("제목 : " + title + "\n 내용 : " + diary);
		UserService service = new UserService();
		service.diary(diary, title);
		response.sendRedirect("diary.jsp");
	}

}
