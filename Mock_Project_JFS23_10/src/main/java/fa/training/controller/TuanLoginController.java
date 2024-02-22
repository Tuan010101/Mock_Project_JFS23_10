package fa.training.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TuanLoginController {
	@GetMapping("/login")
	public String Login() {
		return "login";
	}
	@GetMapping("/forgot-password")
	public String ForgotPassword() {
		return "forgot-password";
	}
}
