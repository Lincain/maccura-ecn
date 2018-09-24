package cn.lincain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/dologin")
	public String doLogin(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if((username+password).equals("admin1234")) {
			return "main";
		}
		if((username+password).equals("lincain2008")) {
			return "userpage";
		}
		else {
			return "login";
		}
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
}
