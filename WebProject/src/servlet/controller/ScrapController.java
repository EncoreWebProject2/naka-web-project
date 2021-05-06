package servlet.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.UserDAOImpl;

public class ScrapController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String u_id = request.getParameter("u_id");
		String scrap = UserDAOImpl.getInstance().getScrap(u_id);
		
		try {
			request.setAttribute("scrap",scrap);
			
			response.getWriter().print(scrap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
