package fa.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fa.training.entities.Product;
import fa.training.service.ContactService;
import fa.training.service.ProductService;

@Controller
public class IndexController {

	@Autowired
	ContactService contactService;

	@Autowired
	private ProductService productService;


	@GetMapping(value = { "/", "/index" })
	public String Home(Model model) {

		List<Product> mixedProducts = productService.getMixedProducts();
		model.addAttribute("mixedProducts", mixedProducts);
		return "index";
	}

	@GetMapping("/about")
	public String About() {
		return "about";
	}

	@GetMapping("/product-single")
	public String ProductSingle() {
		return "product-single";
	}

}
