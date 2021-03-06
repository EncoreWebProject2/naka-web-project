package servlet.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naka.model.UserDAOImpl;
import com.naka.vo.UserVO;

public class ChangeUserInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String email = request.getParameter("email");
		String jobField = request.getParameter("jobField");
		String education = request.getParameter("education");
		String birthday = request.getParameter("birthday");
		String path = "";
		
		UserVO user = new UserVO(id, name, address, phone, status, email, jobField, education, birthday);
		
		
		try {
			PrintWriter out = response.getWriter();
			UserDAOImpl.getInstance().changeUserInfo(user);
			
			UserVO rvo=UserDAOImpl.getInstance().updateInfo(id);
			if(rvo.getBirth_day() == null) {
				rvo.setBirth_day("");
			}
			if(rvo.getStatus() == null) {
				rvo.setStatus("");
			}
			HttpSession session = request.getSession();
			if(rvo!=null) {
				session.setAttribute("rvo", user);
			}
			out.print(name);
			//response.getWriter().write(name);
		}catch(Exception e) {
			
		}
		return path;
	}

}
