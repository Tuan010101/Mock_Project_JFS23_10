package fa.training.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
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
	
	
	@GetMapping("/quick-add-to-cart/{productId}")
	public String QuickAddToCart(Model model, Principal principal, @PathVariable("productId") int productId,
			@RequestParam("quantity") int quantity,@RequestHeader(value = HttpHeaders.REFERER, required = false) final String referrer) {

		String userName = principal.getName();
		AppUser user = appuserService.findByUsername(userName);

		Product product = productService.findById(productId);
		UserProduct existingUserProduct = userProductService.findByProductIdProductIdAndUserIdAndBillIdIsNull(productId,
				user);

		if (existingUserProduct != null) {
			existingUserProduct.setQuantity(existingUserProduct.getQuantity() + 1);
			userProductService.save(existingUserProduct);
		} else {
			UserProduct newUserProduct = new UserProduct();
			newUserProduct.setProductId(product);
			newUserProduct.setUserId(user);
			newUserProduct.setQuantity(quantity);
			userProductService.save(newUserProduct);
		}
		
		return "redirect:" + referrer;
	}
	

}
