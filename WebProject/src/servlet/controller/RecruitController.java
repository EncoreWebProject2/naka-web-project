package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.naka.model.RecruitDAOImpl;
import com.naka.vo.RecruitVO;

public class RecruitController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		String path=null;
		ArrayList<RecruitVO> list = RecruitDAOImpl.getInstance().getRecruits(Integer.parseInt(request.getParameter("num")));
		try {
			PrintWriter pw = response.getWriter();
			Gson gson = new Gson();
			pw.write(gson.toJson(list));
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		
		return path;
	}
}
