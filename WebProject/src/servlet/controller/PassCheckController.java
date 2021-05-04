package servlet.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.UserDAOImpl;

public class PassCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		try {
			PrintWriter out = response.getWriter();
			
			boolean result = UserDAOImpl.getInstance().passcheck(id, password);
			out.print(result);
		}catch(Exception e) {
			
		}
		return null;
	}

}
