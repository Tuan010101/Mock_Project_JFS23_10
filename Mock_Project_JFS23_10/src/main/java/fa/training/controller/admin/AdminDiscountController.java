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

import fa.training.entities.Discount;
import fa.training.entities.Product;
import fa.training.entities.ProductDiscount;
import fa.training.form.AddDiscountForm;
import fa.training.repository.DiscountRepository;
import fa.training.repository.ProductDiscountRepository;
import fa.training.repository.ProductRepository;
import fa.training.service.DiscountService;
import fa.training.service.ProductDiscountService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('DISCOUNT_ADMIN')")
public class AdminDiscountController {

	@Autowired
	DiscountService discountService;
	@Autowired
	ProductDiscountService productDiscountService;
	@Autowired
	ProductDiscountRepository productDiscountRepository;
	@Autowired
	DiscountRepository DiscountRepository;

	@Autowired
	ProductRepository productRepository;

	@GetMapping("/discount")
	public String showAllDiscount(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "percent", defaultValue = "0") int percent, Model model) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		AddDiscountForm addDiscountForm = new AddDiscountForm();

		Map<Integer, String> productMap = productRepository.findAll().stream()
				.collect(Collectors.toMap(Product::getProductId, Product::getProductName));

		Map<Integer, Integer> discountMap = discountService.findAll().stream()
				.collect(Collectors.toMap(Discount::getDiscountId, Discount::getDiscountId));

		model.addAttribute("addDiscountForm", addDiscountForm);
		model.addAttribute("productId", new Product());
		model.addAttribute("discountId", new Discount());
		model.addAttribute("productMap", productMap);
		model.addAttribute("discountMap", discountMap);

		// Trả về trang thực hiện việc hiển thị danh sách discount
		Page<Discount> appDiscountPage;
		if (percent > 0) {
			appDiscountPage = discountService.findByPercent(pageable, percent);
		} else {
			appDiscountPage = discountService.findAll(pageable);
		}
		model.addAttribute("appDiscountPage", appDiscountPage);
		System.out.println(appDiscountPage.getNumber());
		System.out.println(appDiscountPage.getTotalPages());

		return "admin/discount/list";
	}

	@PostMapping("/discount")
	public String createProductDiscount(@ModelAttribute("addDiscountForm") @Valid AddDiscountForm addDiscountForm,
			BindingResult bindingResult, Model model) {
		ProductDiscount productDiscount = new ProductDiscount();
		Discount discount = new Discount();
		Product product = new Product();
		discount.setDiscountId(addDiscountForm.getDiscountId());
		product.setProductId(addDiscountForm.getProductId());

		productDiscount.setProduct(product);
		productDiscount.setDiscount(discount);
		productDiscountService.save(productDiscount);

		return "redirect:/admin/discount?status=save_success";
	}

	@GetMapping("/discount/create")
	public String showCreateDiscountForm(Model model) {
		AddDiscountForm addDiscountForm = new AddDiscountForm();
		model.addAttribute("addDiscountForm", addDiscountForm);
		return "admin/discount/create";
	}

	@PostMapping("/discount/create")
	public String createDiscount(@ModelAttribute("addDiscountForm") @Valid AddDiscountForm addDiscountForm,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			// Nếu có lỗi, hiển thị lại trang tạo discount để người dùng sửa
			return "admin/discount/create";
		}

		Discount discount = new Discount();
		discount.setDiscountPercent(addDiscountForm.getDiscountPercent());
		discount.setStartDiscountDate(addDiscountForm.getStartDiscountDate());
		discount.setEndDiscountDate(addDiscountForm.getEndDiscountDate());
		discountService.save(discount);

		// Sau khi tạo discount thành công, chuyển hướng người dùng đến trang danh sách
		// discount
		return "admin/discount/create";
	}

	@GetMapping("/discount/edit/{id}")
	public String showEditCategories(@PathVariable int id, Model model) {

		Discount discount = discountService.findById(id);
		AddDiscountForm addDiscountForm = new AddDiscountForm(discount);
		model.addAttribute("addDiscountForm", addDiscountForm);

		return "admin/discount/edit";
	}

	@PostMapping("/discount/edit/{id}")
	public String doEditCategories(@PathVariable int id,
			@ModelAttribute("addDiscountForm") @Valid AddDiscountForm addDiscountForm, BindingResult bindingResult,
			Model model) {

		Discount existingDiscount = discountService.findById(id);

		existingDiscount.setDiscountPercent(addDiscountForm.getDiscountPercent());
		existingDiscount.setStartDiscountDate(addDiscountForm.getStartDiscountDate());
		existingDiscount.setEndDiscountDate(addDiscountForm.getEndDiscountDate());

		discountService.save(existingDiscount);

		return "redirect:/admin/discount";

	}

//	@RequestMapping("/discount/delete/{id}")
//	public String doDeleteCategories(@PathVariable int id) {
//		Discount Discount = discountService.findById(id);
//		discountService.delete(Discount);
//
//		return "redirect:/admin/discount";
//	}
}
