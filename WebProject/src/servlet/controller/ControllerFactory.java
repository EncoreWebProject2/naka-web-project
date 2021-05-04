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
		}else if(command.equals("scrapadd.do")) {
			controller = new ScrapAddController();	
		}else if(command.equals("scrap.do")) {
			controller = new ScrapController();	
		}else if(command.equals("scrapdelete.do")) {
			controller = new ScrapDeleteController();	
		}else if(command.equals("login.do")) {
			controller = new LoginController();	
		}else if(command.equals("passcheck.do")) {
			controller = new PassCheckController();	
		}else if(command.equals("logout.do")) {
			controller = new LogoutController();	
		}else if(command.equals("signout.do")) {
			controller = new SignoutController();	
		}
		
		return controller;
	}
}

