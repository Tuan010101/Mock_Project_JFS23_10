package fa.training.controller.admin;

import java.util.Map;
import java.util.Optional;
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
	public String showAllUsers(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<AppUser> appUserPage = appUserService.findAllByUsernameContains(keyword, pageable);

		model.addAttribute("keyword", keyword);
		model.addAttribute("appUserPage", appUserPage);

		System.out.println(appUserPage.getNumber());
		System.out.println(appUserPage.getTotalPages());

		return "admin/User/list";
	}

	@GetMapping("/User/create")
	public String showCreateUserForm(Model model) {
		AddUserForm addUserForm = new AddUserForm();
		Map<Integer, String> rolesMap = roleRepository.findAll().stream()
				.collect(Collectors.toMap(Role::getRoleId, Role::getRoleName));
		model.addAttribute("addUserForm", addUserForm);
		model.addAttribute("rolesMap", rolesMap);
		return "admin/User/create";
	}

	@PostMapping("/User/create")
	public String createUser(@ModelAttribute("addUserForm") @Valid AddUserForm addUserForm, BindingResult bindingResult,
			Model model) {

		if (bindingResult.hasErrors()) {
			Map<Integer, String> rolesMap = roleRepository.findAll().stream()
					.collect(Collectors.toMap(Role::getRoleId, Role::getRoleName));

			model.addAttribute("rolesMap", rolesMap);

			return "admin/User/create";
		}

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

		return "redirect:/admin/User/create";
	}

	@GetMapping("/User/edit/{id}")
	public String showEditUserForm(@PathVariable int id, Model model) {

		AppUser appUser = appUserService.findById(id);

		AddUserForm addUserForm = new AddUserForm(appUser);
		Map<Integer, String> rolesMap = roleRepository.findAll().stream()
				.collect(Collectors.toMap(Role::getRoleId, Role::getRoleName));
		model.addAttribute("addUserForm", addUserForm);
		model.addAttribute("rolesMap", rolesMap);

		return "admin/User/edit";
	}

	@PostMapping("/User/edit/{id}")
	public String editUser(@PathVariable int id, @ModelAttribute("addUserForm") @Valid AddUserForm addUserForm,
			BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			Map<Integer, String> rolesMap = roleRepository.findAll().stream()
					.collect(Collectors.toMap(Role::getRoleId, Role::getRoleName));

			model.addAttribute("rolesMap", rolesMap);
			return "admin/User/edit";
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
}
