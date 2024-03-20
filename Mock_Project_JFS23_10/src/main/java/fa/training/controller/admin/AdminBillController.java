package fa.training.controller.admin;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
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

import fa.training.entities.Bill;
import fa.training.entities.Product;
import fa.training.entities.UserProduct;
import fa.training.form.AddBillForm;
import fa.training.repository.ProductRepository;
import fa.training.service.BillService;
import fa.training.service.ProductService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasBill('BILL_ADMIN')")
public class AdminBillController {

	@Autowired
	BillService billService;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	ProductService productService;

	@GetMapping("/bill")
	public String showAllBill(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<Bill> bills = billService.findAllByFullNameContains(keyword, pageable);

		model.addAttribute("keyword", keyword);
		model.addAttribute("bills", bills);

		return "admin/bill/list";
	}

	@GetMapping("/bill/create")
	public String showCreateBill(@ModelAttribute("addBillForm") AddBillForm addBillForm, Model model) {
		Map<Integer, String> productMap = productService.findAll().stream()
				.collect(Collectors.toMap(Product::getProductId, Product::getProductName));

		model.addAttribute("productMap", productMap);
		return "admin/bill/create";
	}

	@PostMapping("/bill/create")
	public String doCreateBills(@ModelAttribute("addBillForm") @Valid AddBillForm addBillForm,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			// Nếu có lỗi, thêm lại dữ liệu select product vào model
			Map<Integer, String> products = productService.findAll().stream()
					.collect(Collectors.toMap(Product::getProductId, Product::getProductName));
			model.addAttribute("productMap", products);

			return "admin/bill/create"; // Trả về trang create
		}
		Bill bill = new Bill();
		bill.setFullName(addBillForm.getFullName());
		bill.setAddress(addBillForm.getAddress());
		bill.setPhoneNumber(addBillForm.getPhoneNumber());
		bill.setEmail(addBillForm.getEmail());
		bill.setStatus(addBillForm.getStatus());
		bill.setPaymentMethod(addBillForm.getPaymentMethod());
		bill.setBuyDate(addBillForm.getBuyDate());
		bill.setBuyTime(addBillForm.getBuyTime());

		UserProduct userProduct = new UserProduct();
		userProduct.setProductId(productRepository.findById(addBillForm.getUserProductId()).orElse(null));
		userProduct.setBillId(bill);
		bill.getUserProducts().add(userProduct);

		billService.save(bill);

		return "redirect:/admin/bill";
	}

	@GetMapping("/bill/edit/{id}")
	public String showEditBills(@PathVariable int id, Model model) {
		Bill bill = billService.findById(id);
		AddBillForm addBillForm = new AddBillForm(bill);
		Map<Integer, String> productMap = productService.findAll().stream()
				.collect(Collectors.toMap(Product::getProductId, Product::getProductName));
		model.addAttribute("productMap", productMap);// Tạo AddBillForm từ bill
		model.addAttribute("bill", bill);
		model.addAttribute("addBillForm", addBillForm); // Thêm addBillForm vào model
		return "admin/bill/edit";
	}

	@PostMapping("/bill/edit/{id}")
	public String doEditBills(@PathVariable int id, @ModelAttribute("addBillForm") @Valid AddBillForm addBillForm,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			Map<Integer, String> products = productService.findAll().stream()
					.collect(Collectors.toMap(Product::getProductId, Product::getProductName));
			model.addAttribute("productMap", products);
			return "admin/bill/edit";
		}

		Bill existingBill = billService.findById(id);
		existingBill.setFullName(addBillForm.getFullName());
		existingBill.setAddress(addBillForm.getAddress());
		existingBill.setPhoneNumber(addBillForm.getPhoneNumber());
		existingBill.setEmail(addBillForm.getEmail());
		existingBill.setStatus(addBillForm.getStatus());
		existingBill.setPaymentMethod(addBillForm.getPaymentMethod());
		existingBill.setBuyDate(addBillForm.getBuyDate());
		existingBill.setBuyTime(addBillForm.getBuyTime());

		// Chỉ cập nhật danh sách sản phẩm nếu addBillForm có danh sách sản phẩm
		if (addBillForm.getUserProductId() != null) {
			Set<UserProduct> userProducts = new HashSet<>();
			UserProduct userProduct = new UserProduct();
			userProduct.setUserProductId(addBillForm.getUserProductId());
			userProduct.setBillId(existingBill); // Thiết lập billId cho userProduct
			userProducts.add(userProduct);
			existingBill.setUserProducts(userProducts);
		}

		billService.save(existingBill);

		return "redirect:/admin/bill";
	}

	@RequestMapping("/bill/delete/{id}")
	public String doDeleteBills(@PathVariable int id) {
		billService.deleteByBillId(id);

		return "redirect:/admin/bill"; // Chuyển hướng đến trang danh sách hóa đơn, không phải trang xóa sản phẩm
	}

}
