package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.naka.model.RecruitDAOImpl;
import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;

public class CompareController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			int r_id = Integer.parseInt(id);
			
			RecruitVO recruit = RecruitDAOImpl.getInstance().getRecruit(r_id);
			CompanyVO company = RecruitDAOImpl.getInstance().getCompany(recruit.getC_id());
			
			JSONObject json = new JSONObject();
			
			json.put("r_id", recruit.getR_id());
			json.put("title", recruit.getTitle());
			json.put("position",recruit.getPosition());
			json.put("img", company.getLogo_img());
			
			if(recruit.getJob_type().equals("")) {
				json.put("job_type", "무관");
			}else {
				json.put("job_type", recruit.getJob_type());
			}
			
			if(recruit.getExp_date() == null) {
				json.put("exp_date", "상시모집");
			}else {
				json.put("exp_date", recruit.getExp_date());
			}
			
			if(recruit.getTech().equals("")) {
				json.put("tech", "상세 공고 확인");
			}else {
				json.put("tech", recruit.getTech());
			}
			
			out.println(json);
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
