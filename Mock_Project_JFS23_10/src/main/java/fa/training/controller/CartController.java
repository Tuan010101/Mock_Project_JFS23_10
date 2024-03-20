package fa.training.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
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

@Controller
public class CartController {
	@Autowired
	private UserProductService userProductService;

	@Autowired
	private ProductService productService;

	@Autowired
	private AppUserService appUserService;

	private boolean isInDiscountPeriod(LocalDate currentDate, LocalDate startDate, LocalDate endDate) {
		return !currentDate.isBefore(startDate) && !currentDate.isAfter(endDate);
	}

	private double getTotalPrice(AppUser appUser) {
		LocalDate today = LocalDate.now();
		double totalPrice = appUser.getUserProducts().stream().filter(userProduct -> userProduct.getBillId() == null)
				.mapToDouble(userProduct -> {

					Product product = userProduct.getProductId();

					double maxDiscountPercent = product.getProductDiscounts().stream().filter(productDiscount -> {
						LocalDate startDate = productDiscount.getDiscount().getStartDiscountDate();
						LocalDate endDate = productDiscount.getDiscount().getEndDiscountDate();
						return isInDiscountPeriod(today, startDate, endDate);
					}).mapToDouble(productDiscount -> productDiscount.getDiscount().getDiscountPercent()).max()
							.orElse(0.0);

					return product.getPrice() * (1 - maxDiscountPercent / 100.0) * userProduct.getQuantity();
				}).sum();

		DecimalFormat decimalFormat = new DecimalFormat("#.##");
		totalPrice = Double.parseDouble(decimalFormat.format(totalPrice));
		return totalPrice;
	}

	@GetMapping("/cart")
	public String Cart(Model model, Principal principal) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		List<UserProduct> userProducts = userProductService.findAllByUserIdAndBillIdIsNull(appUser);
		model.addAttribute("userProducts", userProducts);
		model.addAttribute("totalPrice", getTotalPrice(appUser));
		return "cart";
	}

	@GetMapping("/cart/plus/{productId}")
	public String plusProductInCart(Model model, Principal principal, @PathVariable("productId") int productId) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		UserProduct userProduct = userProductService.findByProductIdProductIdAndUserIdAndBillIdIsNull(productId,
				appUser);

		userProduct.setQuantity(userProduct.getQuantity() + 1);

		userProductService.save(userProduct);

		return "redirect:/cart";
	}

	@GetMapping("/cart/minus/{productId}")
	public String minusProductInCart(Model model, Principal principal, @PathVariable("productId") int productId) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		UserProduct userProduct = userProductService.findByProductIdProductIdAndUserIdAndBillIdIsNull(productId,
				appUser);

		if (userProduct.getQuantity() > 1) {
			userProduct.setQuantity(userProduct.getQuantity() - 1);
			userProductService.save(userProduct);
		}

		return "redirect:/cart";
	}

	@GetMapping("/cart/delete/{productId}")
	public String deleteProductInCart(Model model, Principal principal, @PathVariable("productId") int productId) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		UserProduct userProduct = userProductService.findByProductIdProductIdAndUserIdAndBillIdIsNull(productId,
				appUser);

		userProduct.setProductId(null);
		userProduct.setUserId(null);

		userProductService.delete(userProduct);
		return "redirect:/cart";
	}

	@GetMapping("/add-to-cart")
	public String addToCart(Model model, Principal principal, @RequestParam("productId") int productId,
			@RequestParam("quantity") int quantity ) {

		String userName = principal.getName();
		AppUser user = appUserService.findByUsername(userName);

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
		return "redirect:/products/" + productId + "?addtocart=success"; 
	}


	@GetMapping("/quick-add-to-cart/{productId}")
	public String quickAddToCart(Model model, Principal principal, @PathVariable("productId") int productId,
	                             @RequestParam("quantity") int quantity,
	                             @RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
	                             @RequestHeader(value = HttpHeaders.REFERER, required = false) final String referrer) {

	    String userName = principal.getName();
	    AppUser user = appUserService.findByUsername(userName);

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

	    
	    return "redirect:" + referrer.split("\\?")[0] + "?addtocart=success&pageNo=" + currentPage;
	}

}
