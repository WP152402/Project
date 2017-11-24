package project.dimigo.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.dimigo.action.CalAction;
import project.dimigo.action.Delete2Action;
import project.dimigo.action.DeleteAction;
import project.dimigo.action.GetAction;
import project.dimigo.action.IAction;
import project.dimigo.action.ListAction;
import project.dimigo.action.LoginAction;
import project.dimigo.action.LogoutAction;
import project.dimigo.action.SignupAction;

/**
 * Servlet implementation class ActionServlet
 */
@WebServlet("*.do")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, IAction> map = new HashMap<>();
    @Override
    public void init() throws ServletException {
    	map.put("login", new LoginAction());
    	map.put("logout", new LogoutAction());
    	map.put("signup", new SignupAction());
    	map.put("list", new ListAction());
    	map.put("get", new GetAction());
    	map.put("cal", new CalAction());
    	map.put("delete", new DeleteAction());
    	map.put("delete2", new Delete2Action());
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.URI(ex)/login.do)로부터 login추출
			String uri = request.getRequestURI();
			System.out.println("uri : " + uri);
			String result = uri.substring(uri.lastIndexOf("/")+1, uri.indexOf(".") );
			System.out.println(result);
			//액션 객체 가져오기
			IAction action = map.get(result);
			if(action == null) {
				throw new Exception(result+" 에 해당하는 Action 클래스가 없습니다");
			}
			//XXACtion의 Execute 실행
			action.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
			rd.forward(request, response);
		}
	}
	
}
