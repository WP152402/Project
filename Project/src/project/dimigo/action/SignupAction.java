package project.dimigo.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.service.UserService;
import org.dimigo.vo.UserVO;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class SignupAction implements IAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject obj = new JsonObject();
		response.setContentType("application/json;charset=utf-8");
		try {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String pwdcheck = request.getParameter("pwdcheck");
		String nickname = request.getParameter("nickname");
		System.out.printf("name : %s, id : %s, pwd : %s, pwdcheck : %s, nickname : %s \n", name, id, pwd, pwdcheck, nickname);

		if(!pwd.equals(pwdcheck)) { //비밀번호와 비밀번호 확인이 일치하는지 점검해줌
			obj.addProperty("msg", "notequal");
			out.write(gson.toJson(obj));
		}
		else {
			
			UserVO vo = new UserVO(id, nickname, name);
			vo.setPwd(pwd);
			System.out.println("입력값 입력 완료");
			UserService service = new UserService();
			service.signup(vo);
			obj.addProperty("msg", "success");
			out.write(gson.toJson(obj));
		}
		
	}catch(Exception e){
		e.printStackTrace();
		obj.addProperty("msg","error");
		out.write(gson.toJson(obj));
		System.out.println(e.getMessage());
		
	}finally {
		out.close();
	}
	}
}
