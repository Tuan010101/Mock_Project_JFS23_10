package fa.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fa.training.entities.UserProduct;
import fa.training.service.UserProductService;

@Controller
public class CartController {
	@Autowired
	private UserProductService userProductService;

	@GetMapping("/cart")
	public String Cart(Model model) {
		model.addAttribute("userProducts", userProductService.findAll());
		return "cart";
	}
//	@GetMapping("/cart")
//	public String Cart() {
//		return "cart";
//	}

//	@PostMapping("/upload")
//	public String doCreate(@Valid @ModelAttribute Person person, BindingResult errors) {
//		personValidate.validate(person, errors);
//		if (errors.hasErrors()) {
//			return "person/create";
//		}
//		personService.save(person);
//		return "redirect:create.jsp";
//	}
}
