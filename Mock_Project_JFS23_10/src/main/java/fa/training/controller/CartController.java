package fa.training.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.AppUser;
import fa.training.entities.Product;
import fa.training.entities.UserProduct;
import fa.training.service.AppUserService;
import fa.training.service.ProductService;
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
	private ProductService productService;

	@Autowired
	private AppUserService appuserService;

	@GetMapping("/cart")
	public String Cart(Model model, Principal principal) {
		AppUser appUser = appuserService.findByUsername(principal.getName());
		List<UserProduct> userProducts = userProductService.findAllByUserIdAndBillId(appUser.getUserId());
		model.addAttribute("userProducts", userProducts);
		return "cart";
	}

	@GetMapping("/add-to-cart")
	public String addToCart(Model model, Principal principal, @RequestParam("productId") int productId,
			@RequestParam("quantity") int quantity) {

		String userName = principal.getName();
		AppUser user = appuserService.findByUsername(userName);
		System.out.println(productId);
		System.out.println(quantity);

		Product product = productService.findById(productId);
		UserProduct existingUserProduct = userProductService.findByProductIdProductIdAndUserIdAndBillIdIsNull(productId,
				user);

		if (existingUserProduct != null) {
			existingUserProduct.setQuantity(existingUserProduct.getQuantity() + quantity);
			userProductService.save(existingUserProduct);
		} else {
			UserProduct newUserProduct = new UserProduct();
			newUserProduct.setProductId(product);
			newUserProduct.setUserId(user);
			newUserProduct.setQuantity(quantity);
			userProductService.save(newUserProduct);
		}
		
		return "redirect:/products/" + productId;
	}

}
