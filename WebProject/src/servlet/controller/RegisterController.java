package servlet.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.*;

import com.google.gson.Gson;
import com.naka.model.UserDAOImpl;
import com.naka.model.RecruitDAOImpl;
import com.naka.vo.RecruitVO;
import com.naka.vo.UserVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String path = null;
		System.out.println("RegisterController");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String email = request.getParameter("email");
		String jobField = request.getParameter("jobField");
		String education = request.getParameter("education");
		String birthday = request.getParameter("birthday");
		String scrap = "";
		
		
		
		String salt = SHA256Util.generateSalt();
        String newPassword = SHA256Util.getEncrypt(request.getParameter("password"), salt);
        
        System.out.println("birthday: "+birthday);

        UserVO vo = new UserVO(id, newPassword, name, address, phone, status, email, jobField, education, birthday, scrap, salt);
        //System.out.println("user vo: "+ user);
        try {
			UserDAOImpl.getInstance().register(vo);
			//response.getWriter().write("loginSuccess");
			response.getWriter().print(name);
		} catch (ParseException e) {
			
		} catch (IOException e) {
		}

				
		return path;
	}

}



