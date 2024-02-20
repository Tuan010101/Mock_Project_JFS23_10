package fa.training.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TuanLoginController {
	@GetMapping("/")
	public String Home() {
		return "Home";
	}
}
