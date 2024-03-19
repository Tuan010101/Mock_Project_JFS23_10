package fa.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fa.training.service.UserProductService;

/**
 * @author Vinh
 * @date 18/3/2023
 */
@Controller
public class CartController {
	@Autowired
	private UserProductService userProductService;

	@GetMapping("/cart")
	public String Cart(Model model) {
		model.addAttribute("userProducts", userProductService.findAll());
		return "cart";
	}

}
