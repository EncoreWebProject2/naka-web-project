package servlet.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naka.model.UserDAOImpl;
import com.naka.vo.UserVO;

public class ChangePasswordController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String path = "";
		
		String salt = SHA256Util.generateSalt();
        String Password = SHA256Util.getEncrypt(request.getParameter("newPassword"), salt);
		HttpSession session = request.getSession();
		UserVO rvo=UserDAOImpl.getInstance().updateInfo(id);
		session.setAttribute("rvo", rvo);
		try {
			UserDAOImpl.getInstance().changePassword(id, Password, salt);
			response.getWriter().print(name);
			//response.getWriter().write(name);
		}catch(Exception e) {
			
		}
		return path;
	}

}
