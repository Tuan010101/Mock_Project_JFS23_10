package fa.training.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import fa.training.entities.AppUser;
import fa.training.entities.Role;
import fa.training.entities.UserRole;
import fa.training.service.AppUserService;
import fa.training.service.RoleService;
import fa.training.service.UserRoleService;

@Controller
public class TuanLoginController {
	
	@Autowired
	AppUserService appUserService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	UserRoleService userRoleService;
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@GetMapping("/login")
	public String Login() {
		return "login";
	}
	@GetMapping("/forgot-password")
	public String ForgotPassword() {
		return "forgot-password";
	}
	
	@GetMapping("/logout")
    public String logoutSuccessfulPage() {
        return "login";
    }
	
	@GetMapping("/register")
	public String Register(@ModelAttribute("appUser") AppUser appUser, Model model) {
		return "register";
	}
	
	@PostMapping("/register")
	public String PostRegister(@ModelAttribute("appUser") @Valid AppUser appUser, BindingResult result, Model model) {
		
		if (appUserService.existsByUsername(appUser.getUsername())) {
			result.rejectValue("username", null, "Tên tài khoản đã tồn tại");
		} else if (appUserService.existsByEmail(appUser.getEmail())) {
			result.rejectValue("email", null, "Email đã tồn tại");
		} 
		
		if (result.hasErrors()) {
			return "register";
		}
		
		AppUser saveAppUser = new AppUser(0, 
				appUser.getUsername(), 
				appUser.getPassword(), 
				passwordEncoder.encode(appUser.getPassword()), 
				appUser.getEmail(), 
				null, 
				null, 
				null, 
				0, 
				null, 
				null);
		Role roleUser = new Role(1, "ROLE_USER", null);
		UserRole userRole = new UserRole(0, roleUser, saveAppUser);

		appUserService.save(saveAppUser);
		userRoleService.save(userRole);
		
		// Tạo một đối tượng Authentication cho người dùng mới đăng ký
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(appUser.getUsername(), appUser.getPassword());
		// Xác thực thông tin đăng nhập của người dùng
		Authentication authentication = authenticationManager.authenticate(authenticationToken);
		// Nếu xác thực thành công, đặt Authentication vào SecurityContext
		SecurityContextHolder.getContext().setAuthentication(authentication);
			
		return "index";
	}
}
