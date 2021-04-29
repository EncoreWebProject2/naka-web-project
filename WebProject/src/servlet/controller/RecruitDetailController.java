package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.RecruitDAOImpl;
import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;

public class RecruitDetailController  implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		String path = null;
		
		RecruitVO rvo = RecruitDAOImpl.getInstance().getRecruit(id);
		CompanyVO cvo =  RecruitDAOImpl.getInstance().getCompany(rvo.getC_id());
		if(rvo!=null) {
			 request.setAttribute("rvo", rvo);
			 request.setAttribute("cvo", cvo);
			  path=  "recruit_details.jsp";				 				  
		}		
		
		return path;
	}

}
