package servlet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naka.model.RankDAOImpl;
import com.naka.model.RecruitDAOImpl;
import com.naka.vo.RecruitVO;

public class RankController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String command = request.getParameter("rank_command");
		String path = null;
		if(command.equals("tech")) {
			//RankDAOImpl.getInstance().refreshRank();
		RankDAOImpl.getInstance().getTechRank();
		}
		else
			path = "ranking.jsp";
		return path;	
	}
	
}
