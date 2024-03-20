package fa.training.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fa.training.entities.AppUser;
import fa.training.entities.UserProduct;
import fa.training.service.AppUserService;
import fa.training.service.UserProductService;

/**
 * @author Vinh
 * @date 18/3/2023
 */
@Controller
public class CartController {
	@Autowired
	private UserProductService userProductService;
	
	@Autowired
	AppUserService appUserService;

	@GetMapping("/cart")
	public String Cart(Model model, Principal principal) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		List<UserProduct> userProducts = userProductService.findAllByUserIdAndBillIdIsNull(appUser);
		model.addAttribute("userProducts", userProducts);
		return "cart";
	}
	
	
}
