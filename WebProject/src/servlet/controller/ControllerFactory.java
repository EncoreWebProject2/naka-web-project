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
			System.out.println("factory");
			controller = new recruitDetailController();
			
		}else if(command.equals("recruit.do")) {
			controller = new RecruitController();	
		}
		return controller;
	}
}
