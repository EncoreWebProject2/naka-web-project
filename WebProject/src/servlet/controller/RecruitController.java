package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

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
		
		String command = request.getParameter("command");
		
		String path=null;
		if(command.equals("pageCount")) {			
			getPageCount(request,response);
		}
		else if(command.equals("getRecruits")) {
			getRecruits(request, response);
		}
				
		
		return path;
	}
	
	private void getPageCount(HttpServletRequest request, HttpServletResponse response) {
		String position = request.getParameter("position");
		String job_type = request.getParameter("job_type");
		String education = request.getParameter("education");
		String keyword = request.getParameter("keyword");
		String scrap = request.getParameter("scrap");
		int pageCount=0;
		
		if(position.equals("")&&job_type.equals("")&&education.equals("")&&keyword.equals("")&&(scrap==null||scrap.equals(""))) {
			pageCount = RecruitDAOImpl.getInstance().getTotalCount();
		}else {
			pageCount = RecruitDAOImpl.getInstance().getSearchCount(position, job_type, education, keyword, scrap);
		}
		
		
		try {
			PrintWriter pw = response.getWriter();
			Gson gson = new Gson();
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			map.put("pageCount", pageCount);
			pw.write(gson.toJson(map));
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	private void getRecruits(HttpServletRequest request, HttpServletResponse response) {
		String position = request.getParameter("position");
		String job_type = request.getParameter("job_type");
		String education = request.getParameter("education");
		String keyword = request.getParameter("keyword");
		String scrap = request.getParameter("scrap");
		int pageNumber = Integer.parseInt(request.getParameter("num"));
		
		
		ArrayList<RecruitVO> list = RecruitDAOImpl.getInstance().searchRecruits(position,job_type,education,keyword,scrap,pageNumber);
		try {
			PrintWriter pw = response.getWriter();
			Gson gson = new Gson();
			pw.write(gson.toJson(list));
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
}
