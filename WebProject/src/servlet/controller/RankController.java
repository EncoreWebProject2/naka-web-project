package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.naka.model.RankDAOImpl;
import com.naka.vo.RankVO;

public class RankController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String command = request.getParameter("rank_command");
//		String path = null;
//		RankDAOImpl.getInstance().refreshRank();
		
		
		response.setContentType("text/html;charset=utf-8");
		String path = null;
		ArrayList<RankVO> list = command.equals("tech")?RankDAOImpl.getInstance().getTechRank():command.equals("position")?
				RankDAOImpl.getInstance().getPositionRank():RankDAOImpl.getInstance().getTypeRate();
		try {
			PrintWriter pw = response.getWriter();
			Gson gson = new Gson();
			pw.write(gson.toJson(list));
			pw.flush();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return path;	
	}
}
