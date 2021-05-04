package servlet.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naka.model.UserDAOImpl;
import com.naka.vo.UserVO;

public class DeleteAccountController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id=  request.getParameter("id");
		String password = request.getParameter("password");
		
		String path = "index.jsp";
		try {
			UserDAOImpl.getInstance().signout(id, password);
			
			HttpSession session = request.getSession();
			UserVO rvo= (UserVO)session.getAttribute("rvo");
			
			if(rvo != null) {
				session.invalidate();
			}

		}catch(Exception e) {
			
		}
		return path;
	}

}
