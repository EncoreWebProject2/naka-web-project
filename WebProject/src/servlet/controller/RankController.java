package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.naka.model.RankDAOImpl;
import com.naka.model.RecruitDAOImpl;
import com.naka.vo.RankVO;
import com.naka.vo.RecruitVO;

public class RankController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
//		String command = request.getParameter("rank_command");
//		String path = null;
//		if(command.equals("tech")) {
//			RankDAOImpl.getInstance().refreshRank();
//		RankDAOImpl.getInstance().getTechRank();
//		}
//		else
//			path = "ranking.jsp";
		
		response.setContentType("text/html);charset=utf-8");
		String path = null;
		ArrayList<RankVO> list = RankDAOImpl.getInstance().getTechRank(request.getParameter("name"), Integer.parseInt(request.getParameter("value")));
		try {
			PrintWriter pw = response.getWriter();
			Gson gson = new Gson();
			pw.write(gson.toJson(list));
			pw.flush();
		}catch(IOException e) {
			
		}
		
		return path;	
	}
}
