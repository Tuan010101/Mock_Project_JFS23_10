package fa.training.controller.admin;

import java.util.Optional;

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

import fa.training.entities.AppUser;
import fa.training.entities.Role;
import fa.training.entities.UserRole;
import fa.training.form.AddUserForm;
import fa.training.repository.RoleRepository;
import fa.training.service.AppUserService;
import fa.training.service.UserRoleService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminUserController {

	@Autowired
	AppUserService appUserService;
	@Autowired
	UserRoleService userRoleService;
	@Autowired
	RoleRepository roleRepository;

	@GetMapping("/User")
	public String showAllProducts(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<AppUser> appUser = appUserService.findAllByUsernameContains(keyword, pageable);

		model.addAttribute("keyword", keyword);
		model.addAttribute("appUser", appUser);

		System.out.println(appUser.getNumber());
		System.out.println(appUser.getTotalPages());

		return "admin/User/list";
	}

	@GetMapping("/User/create")
	public String showCreateUser(@ModelAttribute("addUserForm") AddUserForm addUserForm, Model model) {

		return "admin/User/create";
	}

	@PostMapping("/User/create")
	public String doCreateuUser(@ModelAttribute("addProductForm") @Valid AddUserForm addUserForm,
			BindingResult bindingResult, Model model) {

		AppUser appUser = new AppUser();
		appUser.setUsername(addUserForm.getUserName());
		appUser.setPassword(addUserForm.getPassword());
		appUser.setEmail(addUserForm.getEmail());
		appUser.setFullName(addUserForm.getFullName());
		appUser.setAddress(addUserForm.getAddress());
		appUser.setPhoneNumber(addUserForm.getPhoneNumber());
		appUser.setVerifyCode(addUserForm.getVerifyCode());
		appUserService.save(appUser);

		Optional<Role> roleOptional = roleRepository.findById(addUserForm.getRoleId());

		// Nếu Role tồn tại, tạo đối tượng UserRole và lưu vào cơ sở dữ liệu
		Role role = roleOptional.get();
		UserRole userRole = new UserRole();
		userRole.setRoleId(role);
		userRole.setUserId(appUser); // Sử dụng setUserId thay vì setAppUser
		userRoleService.save(userRole);

		return "admin/User/create";
	}

	@GetMapping("/User/edit/{id}")
	public String showEditUser(@PathVariable int id, Model model) {

		AppUser appUser = appUserService.findById(id);

		AddUserForm addUserForm = new AddUserForm(appUser);
		model.addAttribute("addUserForm", addUserForm);

		return "admin/User/edit";
	}

	@PostMapping("/User/edit/{id}")
	public String doEditUser(@PathVariable int id, @ModelAttribute("addProductForm") @Valid AddUserForm addUserForm,
			BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			// Xử lý lỗi nếu có
			return "admin/User/edit"; // Trả về view form chỉnh sửa nếu có lỗi
		}

		AppUser existingAppUser = appUserService.findById(id);
		existingAppUser.setUsername(addUserForm.getUserName());
		existingAppUser.setPassword(addUserForm.getPassword());
		existingAppUser.setEmail(addUserForm.getEmail());
		existingAppUser.setFullName(addUserForm.getFullName());
		existingAppUser.setAddress(addUserForm.getAddress());
		existingAppUser.setPhoneNumber(addUserForm.getPhoneNumber());
		existingAppUser.setVerifyCode(addUserForm.getVerifyCode());

		appUserService.save(existingAppUser);

		Optional<Role> roleOptional = roleRepository.findById(addUserForm.getRoleId());

		// Nếu Role tồn tại, tạo đối tượng UserRole và lưu vào cơ sở dữ liệu
		Role role = roleOptional.get();
		UserRole userRole = new UserRole();
		userRole.setRoleId(role);
		userRole.setUserId(existingAppUser); // Sử dụng setUserId thay vì setAppUser
		userRoleService.save(userRole);

		return "redirect:/admin/User/create";

	}
//
//	@RequestMapping("/products/delete/{id}")
//	public String doDeleteCategories(@PathVariable int id) {
//		Product product = productService.findById(id);
//		productService.delete(product);
//
//		return "redirect:/admin/products";
//	}

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
