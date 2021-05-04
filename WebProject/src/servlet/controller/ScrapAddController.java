package servlet.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.UserDAOImpl;

public class ScrapAddController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		UserDAOImpl.getInstance().addScrap("qlalf9824", r_id);
		
		try {
			response.getWriter().print(r_id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
