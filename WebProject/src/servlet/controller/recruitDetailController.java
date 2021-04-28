package servlet.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.RecruitDAOImpl;
import com.naka.vo.CompanyVO;
import com.naka.vo.RecruitVO;

public class recruitDetailController  implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		String path = null;
		System.out.println("id = "+id);
		System.out.println("controller");
		RecruitVO rvo = RecruitDAOImpl.getInstance().getRecruit(id);
		//CompanyVO pvo =  RecruitDAOImpl.getInstance().getCompany(id);
		if(rvo!=null) {
			 request.setAttribute("rvo", rvo);
			  path=  "recruit_details.jsp";				 				  
		}		
		
		return path;
	}

}
