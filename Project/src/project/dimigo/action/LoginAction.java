package project.dimigo.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class LoginAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd : %s\n", id, pwd);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		if(id.equals("admin")&&pwd.equals("admin")) {
			request.getSession().setAttribute("user", "고영은");
			obj.addProperty("msg", "success");
			out.write(gson.toJson(obj));
		}
		else {
			obj.addProperty("msg", "error");
			request.getSession().setAttribute("msg", "error");
			out.write(gson.toJson(obj));
		}
		out.close();
	}

}
