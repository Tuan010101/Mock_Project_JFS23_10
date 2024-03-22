package fa.training.controller.admin;

import java.util.Set;

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
import fa.training.service.CategoryService;
import fa.training.service.ProductService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminCategoryController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;

	@GetMapping("/categories")
	public String showAllCategories(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<Category> categories = categoryService.findAllByCategoryNameContains(keyword, pageable);

		model.addAttribute("keyword", keyword);
		model.addAttribute("categories", categories);

		return "admin/category/list";
	}

	@GetMapping("/categories/create")
	public String showCreateCategories(@ModelAttribute("category") Category category) {
		return "admin/category/create";
	}

	@PostMapping("/categories/create")
	public String doCreateCategories(@ModelAttribute("category") @Valid Category category,
			BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "admin/category/create";
		}

		categoryService.save(category);

		return "redirect:/admin/categories";
	}

	@GetMapping("/categories/edit/{id}")
	public String showEditCategories(@PathVariable int id, Model model) {
		Category category = categoryService.findById(id);

		model.addAttribute("category", category);

		return "admin/category/edit";
	}

	@PostMapping("/categories/edit/{id}")
	public String doEditCategories(@PathVariable int id, @ModelAttribute("category") @Valid Category category,
			BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			return "admin/category/edit";
		}
		Category existingCategory = categoryService.findById(id);
		existingCategory.setCategoryName(category.getCategoryName());
		categoryService.save(existingCategory);

		return "redirect:/admin/categories";

	}

	@PostMapping("/categories/delete/{id}")
	public String doDeleteCategories(@PathVariable int id) {

		Category category = categoryService.findById(id);

		Set<Product> products = category.getProducts();
		for (Product product : products) {
			product.setDeleted(true);
		}
		productService.saveAll(products);

		category.setDeleted(true);
		categoryService.save(category);

		return "redirect:/admin/categories";
	}

	@PostMapping("/categories/Undelete/{id}")
	public String doUnDeleteCategories(@PathVariable int id) {

		Category category = categoryService.findById(id);

		Set<Product> products = category.getProducts();
		for (Product product : products) {
			product.setDeleted(false);
		}
		productService.saveAll(products);

		category.setDeleted(false);
		categoryService.save(category);

		return "redirect:/admin/categories";
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
