package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naka.model.UserDAOImpl;
import com.naka.vo.UserVO;

public class LoginController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id=  request.getParameter("id");
		String password = request.getParameter("password");
		
		String path = "login.jsp";
		try {
			UserVO rvo=UserDAOImpl.getInstance().login(id, password);
			
			HttpSession session = request.getSession();
			if(rvo!=null) {
				session.setAttribute("rvo", rvo);
				path="index.jsp";
			}
		}catch(Exception e) {
			
		}
		return path;
	}

}
