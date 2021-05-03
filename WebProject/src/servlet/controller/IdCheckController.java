package servlet.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.UserDAOImpl;

public class IdCheckController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		try {
			PrintWriter out = response.getWriter();
			
			boolean result = UserDAOImpl.getInstance().isExist(id);
			out.print(result);
		}catch(Exception e) {
			
		}
		return null;
	}

}
