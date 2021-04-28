package servlet.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RecruitDAO;
import com.naka.vo.RecruitVO;

public class CompanyController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String s = request.getParameter("id");
        int num = Integer.parseInt(s);
		
        ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
        try {
			String img = RecruitDAO.getInstance().getCompany(num);
			System.out.println(img);
        	request.setAttribute("img", img);
        }catch(SQLException e) {
        	
        }
		
		return "company.jsp";
	}
	
}
