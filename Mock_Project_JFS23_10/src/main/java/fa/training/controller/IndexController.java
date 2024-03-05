package fa.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import fa.training.service.ContactService;

@Controller
public class IndexController {

	@Autowired
	ContactService contactService;

	@GetMapping(value = { "/", "/index" })
	public String Home() {
		return "index";
	}

	@GetMapping("/about")
	public String About() {
		return "about";
	}

	@GetMapping("/cart")
	public String Cart() {
		return "cart";
	}

	@GetMapping("/product-single")
	public String ProductSingle() {
		return "product-single";
	}


}
