package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naka.model.UserDAOImpl;
import com.naka.vo.UserVO;

public class LogoutController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = "index.jsp";
		
		HttpSession session = request.getSession();
		UserVO rvo= (UserVO)session.getAttribute("rvo");
		
		if(rvo != null) {
			session.invalidate();
		}
		
		return path;
	}

}
