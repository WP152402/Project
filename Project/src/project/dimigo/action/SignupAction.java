package project.dimigo.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class SignupAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String pwdcheck = request.getParameter("pwdcheck");
		System.out.printf("name : %s, id : %s, pwd : %s, pwdcheck : %s\n", name, id, pwd, pwdcheck);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		if(!pwd.equals(pwdcheck)) {
			obj.addProperty("msg", "notequal");
			out.write(gson.toJson(obj));
		}
		else {
			obj.addProperty("msg", "success");
			//request.getSession().setAttribute("msg", "error");
			out.write(gson.toJson(obj));
		}
		out.close();
	}

}
