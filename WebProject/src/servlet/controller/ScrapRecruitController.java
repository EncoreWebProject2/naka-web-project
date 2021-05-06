package servlet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.naka.model.RecruitDAOImpl;
import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;

public class ScrapRecruitController  implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		RecruitVO rvo = RecruitDAOImpl.getInstance().getRecruit(id);
		CompanyVO cvo =  RecruitDAOImpl.getInstance().getCompany(rvo.getC_id());

		try {
			if(rvo!=null) {
				JSONObject recruit = new JSONObject();
				recruit.put("r_id", rvo.getR_id());
				recruit.put("title", rvo.getTitle());
				recruit.put("position", rvo.getPosition());
				recruit.put("tech", rvo.getTech());
				recruit.put("link", rvo.getLink());
				recruit.put("exp_date", rvo.getExp_date());
				recruit.put("company_name", cvo.getCompany_name());
				recruit.put("logo_img", cvo.getLogo_img());
				
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(recruit);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
