package fa.training.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class IndexController {
	@GetMapping("/")
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
	@GetMapping("/checkout")
	public String Checkout() {
		return "checkout";
	}
	@GetMapping("/contact")
	public String Contact() {
		return "contact";
	}
	@GetMapping("/product-single")
	public String ProductSingle() {
		return "product-single";
	}
	@GetMapping("/shop")
	public String Shop() {
		return "shop";
	}
	@GetMapping("/register")
	public String Register() {
		return "register";
	}
}
