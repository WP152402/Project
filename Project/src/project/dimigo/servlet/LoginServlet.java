package project.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
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
