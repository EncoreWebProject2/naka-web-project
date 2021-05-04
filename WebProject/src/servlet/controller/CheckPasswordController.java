package servlet.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.UserDAOImpl;

public class CheckPasswordController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");	
		boolean result = false;
		try {
			PrintWriter out = response.getWriter();
			
			String[] arr = UserDAOImpl.getInstance().checkPassword(id);
			System.out.println("arr: "+arr);
	        String checkPassword = SHA256Util.getEncrypt(password, arr[1]);
			if(arr[0].equals(checkPassword)) {
				result = true;
			}
			out.print(result);
		}catch(Exception e) {
			
		}
		return null;
	}

}
