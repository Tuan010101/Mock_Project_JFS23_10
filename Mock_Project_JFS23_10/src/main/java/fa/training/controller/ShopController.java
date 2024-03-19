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

	@GetMapping("/products/{productId}")
	public String getProductDetail(@PathVariable int productId, Model model) {
		// Retrieve the current product
		Product product = productService.findById(productId);

		// Get the category of the current product
		Category category = product.getCategoryId();

		// Retrieve related products based on the category (excluding the current
		// product)
		List<Product> relatedProducts = productService.findAllByCategoryIdAndProductIdNotAndDeletedFalse(category, productId);

		// Add the current product, category, and related products to the model
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		model.addAttribute("relatedProducts", relatedProducts);

		return "product-single";
	}

	@GetMapping("/products")
	public String findPaginated(@RequestParam(value = "keyword", defaultValue = "") String keyword,
	                            @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
	                            @RequestParam(value = "category", defaultValue = "-1") String categoryId,
	                            Model model) {

	    int pageSize = 4;
	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

	    model.addAttribute("categories", categoryService.findAllByDeletedFalse());
	    String trimmedKeyword = keyword.trim();

	    List<Product> products;
	    Page<Product> productPage;
	    if (categoryId.equals("-1")) {
	        productPage = productService.findAllByProductNameContainingAndDeletedFalseOrderByProductId(trimmedKeyword, pageable);
	    } else {
	        Category category = categoryService.findById(Integer.valueOf(categoryId));
	        productPage = productService.findAllByCategoryIdAndProductNameContainingAndDeletedFalseOrderByProductId(category, trimmedKeyword, pageable);
	    }

	    products = productPage.getContent();
	    model.addAttribute("products", products);
	    model.addAttribute("keyword", trimmedKeyword);
	    model.addAttribute("productPage", productPage);

	    return "shop";
	}


}
