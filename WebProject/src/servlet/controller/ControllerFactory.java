package servlet.controller;

public class ControllerFactory {

	private static ControllerFactory factory = new ControllerFactory();
	private ControllerFactory() {}
	public static ControllerFactory getInstance() {
		return factory;
	}
	
	public Controller createController(String command) {
		Controller controller = null;
		if(command.equals("compare.do")) {
			System.out.println("compare");
			controller = new CompareController();
		}else if(command.equals("company.do")) {
			System.out.println("company");
			controller = new CompanyController();
		}
		return controller;
	}
}
