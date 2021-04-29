package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.RecruitDAOImpl;
import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;
import org.json.JSONObject;
/**
 * Servlet implementation class CompareServlet
 */
@WebServlet("/CompareServlet")
public class CompareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		int r_id = Integer.parseInt(id);
		
		RecruitVO recruit = RecruitDAOImpl.getInstance().getRecruit(r_id);
		CompanyVO company = RecruitDAOImpl.getInstance().getCompany(recruit.getC_id());
		
		JSONObject json = new JSONObject();
		
		json.put("r_id", recruit.getR_id());
		json.put("title", recruit.getTitle());
		json.put("position",recruit.getPosition());
		json.put("tech", recruit.getTech());
		json.put("job_type", recruit.getJob_type());
		json.put("img", company.getLogo_img());
		if(recruit.getExp_date() == null) {
			json.put("exp_date", "상시모집");
		}else {
			json.put("exp_date", recruit.getExp_date());
		}	
		out.println(json);
		
	}

}
