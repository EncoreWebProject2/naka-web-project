package servlet.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RecruitDAO;
import com.naka.vo.RecruitVO;

public class CompareController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String[] s = request.getParameterValues("recruit");
        int[] nums = Arrays.stream(s).mapToInt(Integer::parseInt).toArray();
		
        ArrayList<RecruitVO> list = new ArrayList<RecruitVO>();
        try {
        	for(int n : nums) {
    			RecruitVO vo = RecruitDAO.getInstance().getRecruit(n);
    			list.add(vo);
    		}
        	
        	request.setAttribute("list", list);
        }catch(SQLException e) {
        	
        }
		
		return "compare.jsp";
	}
	
}
