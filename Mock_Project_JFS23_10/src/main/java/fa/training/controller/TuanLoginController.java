package fa.training.controller;

import java.util.Random;

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
import fa.training.form.ForgotPasswordForm;
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
	public String ForgotPassword(@ModelAttribute("forgotPasswordForm") ForgotPasswordForm forgotPasswordForm, Model model) {
		String sendCode = "notyet";
		model.addAttribute("sendCode", sendCode);
		return "forgot-password";
	}
	
	@PostMapping("/forgot-password")
	public String ExistUserEmail(@ModelAttribute("forgotPasswordForm") @Valid ForgotPasswordForm forgotPasswordForm, BindingResult result, Model model) {
		if (!appUserService.existsByEmailAndStatus(forgotPasswordForm.getEmail(), 1)) {
			result.rejectValue("email", null, "Email has not been activated or not exists");
		}
		if (result.hasErrors()) {
			String sendCode = "notyet";
			model.addAttribute("sendCode", sendCode);
			return "forgot-password";
		}
		
		//Create verifyCode
        Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000;
        String verifyCode = Integer.toString(randomNumber);
        AppUser appUser = appUserService.findByEmail(forgotPasswordForm.getEmail());
        appUser.setVerifyCode(verifyCode);
        appUserService.save(appUser);
        
        String message = "We have sent the verification code to your email. Please check your email";
        String messageColor = "secondary";
		String sendCode = "done";
		model.addAttribute("sendCode", sendCode);
		model.addAttribute("message", message);
		model.addAttribute("messageColor", messageColor);
		return "forgot-password";
	}
	
	@PostMapping("/forgot-password/check-verifycode")
	public String CheckVerifyCodeFromEmail(@ModelAttribute("forgotPasswordForm") @Valid ForgotPasswordForm forgotPasswordForm, BindingResult result, Model model) {
		if (!appUserService.existsByEmailAndStatus(forgotPasswordForm.getEmail(), 1)) {
			result.rejectValue("email", null, "Email has not been activated or not exists");
		}
		if (result.hasErrors()) {
			String sendCode = "notyet";
			model.addAttribute("sendCode", sendCode);
			return "forgot-password";
		}
		
		//Check verifyCode
		AppUser appUser = appUserService.findByEmail(forgotPasswordForm.getEmail());
		if (appUser.getVerifyCode() != null && appUser.getVerifyCode().equals(forgotPasswordForm.getVerifyCode()) && !appUser.getVerifyCode().isEmpty()) {
			Random random = new Random();
	        int randomNumber = random.nextInt(900000) + 100000;
	        String password = Integer.toString(randomNumber);
	        appUser.setPassword(password);
	        appUser.setEncryptedPassword(passwordEncoder.encode(password));
	        appUser.setVerifyCode(null);
	        appUserService.save(appUser);
	        String message = "Verify success. We have sent username and password to your email. Please check your email";
	        String messageColor = "success";
	        model.addAttribute("messageColor", messageColor);
	        model.addAttribute("message", message);
		} else {
			String message = "Verification code is incorrect. Please check the verification code carefully";
			String messageColor = "danger";
	        model.addAttribute("messageColor", messageColor);
			model.addAttribute("message", message);
		}
		
		String sendCode = "done";
		model.addAttribute("sendCode", sendCode);
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
				null,
				0, 
				null, 
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
