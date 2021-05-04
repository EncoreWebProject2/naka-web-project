package servlet.controller;

public class ControllerFactory {

	private static ControllerFactory factory = new ControllerFactory();
	private ControllerFactory() {}
	public static ControllerFactory getInstance() {
		return factory;
	}
	
	public  Controller  createController(String command) {
		Controller controller = null;
		if(command.equals("recruit_detail.do")) {
			controller = new RecruitDetailController();
		}else if(command.equals("recruit.do")) {
			controller = new RecruitController();	
		}else if(command.equals("idcheck.do")) {
			controller = new IdCheckController();
		}else if(command.equals("register.do")) {
			controller = new RegisterController();	
		}else if(command.equals("login.do")) {
			controller = new LoginController();	
		}else if(command.equals("passcheck.do")) {
			controller = new PassCheckController();	
		}else if(command.equals("logout.do")) {
			controller = new LogoutController();	
		}else if(command.equals("changeUserInfo.do")) {
			controller = new ChangeUserInfoController();	
		}else if(command.equals("changePassword.do")) {
			controller = new ChangePasswordController();	
		}else if(command.equals("checkPassword.do")) {
			controller = new CheckPasswordController();	
		}
		
		return controller;
	}
}

