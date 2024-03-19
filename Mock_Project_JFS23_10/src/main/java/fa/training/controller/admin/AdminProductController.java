package fa.training.controller.admin;

import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.Category;
import fa.training.entities.Product;
import fa.training.form.AddProductForm;
import fa.training.service.CategoryService;
import fa.training.service.ProductService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminProductController {

	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;

	@GetMapping("/products")
	public String showAllProducts(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		int pageSize = 3;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<Product> products = productService.findAllByProductNameContains(keyword, pageable);

		model.addAttribute("keyword", keyword);
		model.addAttribute("products", products);

		System.out.println(products.getNumber());
		System.out.println(products.getTotalPages());

		return "admin/product/list";
	}

	@GetMapping("/products/create")
	public String showCreateProducts(@ModelAttribute("addProductForm") AddProductForm addProductForm, Model model) {

		Map<Integer, String> categories = categoryService.findAll().stream()
				.collect(Collectors.toMap(Category::getCategoryId, Category::getCategoryName));

		model.addAttribute("categories", categories);
		return "admin/product/create";
	}

	@PostMapping("/products/create")
	public String doCreateCategories(@ModelAttribute("addProductForm") @Valid AddProductForm addProductForm,
			BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			Map<Integer, String> categories = categoryService.findAll().stream()
					.collect(Collectors.toMap(Category::getCategoryId, Category::getCategoryName));

			model.addAttribute("categories", categories);

			return "admin/product/create";
		}

		Product product = new Product();
		product.setProductName(addProductForm.getProductName());
		product.setImage(addProductForm.getImage());
		product.setDescription(addProductForm.getDescription());
		product.setPrice(addProductForm.getPrice());
		product.setQuantity(addProductForm.getQuantity());
		product.setCategoryId(categoryService.findById(addProductForm.getCategoryId()));

		productService.save(product);

		return "redirect:/admin/products";
	}

	@GetMapping("/products/edit/{id}")
	public String showEditCategories(@PathVariable int id, Model model) {
		Map<Integer, String> categories = categoryService.findAll().stream()
				.collect(Collectors.toMap(Category::getCategoryId, Category::getCategoryName));

		model.addAttribute("categories", categories);

		Product product = productService.findById(id);

		AddProductForm addProductForm = new AddProductForm(product);
		model.addAttribute("addProductForm", addProductForm);

		return "admin/product/edit";
	}

	@PostMapping("/products/edit/{id}")
	public String doEditCategories(@PathVariable int id,
			@ModelAttribute("addProductForm") @Valid AddProductForm addProductForm, BindingResult bindingResult,
			Model model) {

		if (bindingResult.hasErrors()) {
			Map<Integer, String> categories = categoryService.findAll().stream()
					.collect(Collectors.toMap(Category::getCategoryId, Category::getCategoryName));

			model.addAttribute("categories", categories);

			return "admin/product/edit";
		}
		Product existingProduct = productService.findById(id);

		existingProduct.setProductName(addProductForm.getProductName());
		existingProduct.setImage(addProductForm.getImage());
		existingProduct.setDescription(addProductForm.getDescription());
		existingProduct.setPrice(addProductForm.getPrice());
		existingProduct.setQuantity(addProductForm.getQuantity());
		existingProduct.setCategoryId(categoryService.findById(addProductForm.getCategoryId()));

		productService.save(existingProduct);

		return "redirect:/admin/products";

	}

	@RequestMapping("/products/delete/{id}")
	public String doDeleteCategories(@PathVariable int id) {
		Product product = productService.findById(id);
		product.setDeleted(true);
		productService.save(product);

		return "redirect:/admin/products";
	}

//	trang All: 		GET  /products					showAllProducts()
//	trang One: 		GET  /products/{id}				showOneProducts()
//
//	trang create: 	GET  /products/create			showCreateProducts()
//	submit create: 	POST /products/create			doCreateProducts()
//
//	trang edit: 	GET  /products/edit/{id}		showEditProducts()
//	submit edit: 	POST /products/edit/{id}		doEditProducts()
//	
//	delete			GET/POST /products/delete/{id}	doDeleteProducts()

}
