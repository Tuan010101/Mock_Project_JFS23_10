/**
 * 
 */
package fa.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.Category;
import fa.training.entities.Product;
import fa.training.service.CategoryService;
import fa.training.service.ProductService;

/**
 * 
 */
@Controller
public class ShopController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/product-single/{productId}")
	public String viewProductSinglePage(Model model, @PathVariable("productId") int productId) {
		model.addAttribute("product", productService.findById(productId));
		return "product-single";

	}

	@GetMapping("/shop")
	public String findPaniganated(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "category", defaultValue = "-1") String categoryId, Model model) {

		int pageSize = 4;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Category category = categoryService.findById(Integer.valueOf(categoryId));

		model.addAttribute("categories", categoryService.getAllCategory());

		List<Product> products;
		Page<Product> productPage;
		if (categoryId.equals("-1")) {
			productPage = productService.findAllByProductNameContainingOrderByProductId(keyword, pageable);
			products = productService.findAllByProductNameContainingOrderByProductId(keyword, pageable).getContent();
		} else {
			productPage = productService.findAllByCategoryIdAndProductNameContainingOrderByProductId(category, keyword,
					pageable);
			products = productService
					.findAllByCategoryIdAndProductNameContainingOrderByProductId(category, keyword, pageable)
					.getContent();
		}
		model.addAttribute("products", products);
		model.addAttribute("keyword", keyword);
		model.addAttribute("productPage", productPage);

		return "shop";

	}

}
