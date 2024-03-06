package fa.training.controller;

import java.security.Principal;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.common.SendMail;
import fa.training.entities.AppUser;
import fa.training.form.ChangePasswordForm;
import fa.training.service.AppUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	AppUserService appUserService;

	@PreAuthorize("hasAnyRole('ROLE_USER')")
	@GetMapping("/profile")
	public String GetProfileUser(Principal principal, Model model) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		if (appUser.getPassword().length() < 2) {
			appUser.setPassword("****");
		}else {
			appUser.setPassword(appUser.getPassword().substring(0, 2) + "****");
		}
		appUser.setEmail(appUser.getEmail().substring(0, 2) + "****");
		
		model.addAttribute("appUserForm", appUser);
		return "profile";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER')")
	@PostMapping("/profile")
	public String PostProfileUser(Principal principal, Model model, @ModelAttribute("appUserForm") AppUser appUserForm) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		appUser.setFullName(appUserForm.getFullName());
		appUser.setPhoneNumber(appUserForm.getPhoneNumber());
		appUser.setAddress(appUserForm.getAddress());
		appUserService.save(appUser);
		return "redirect:/user/profile?status=change_profile_success";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER')")
	@PostMapping("/profile/change-password")
	public String ChangePassword(@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,
			Principal principal) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		
		if (!changePasswordForm.getCurrentPassword().equals(appUser.getPassword())) {
			return "redirect:/user/profile?status=incorrect_password";
		}
		appUser.setPassword(changePasswordForm.getNewPassword());
		appUserService.save(appUser);
		return "redirect:/user/profile?status=change_password_success";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER')")
	@PostMapping("/profile/change-email")
	public String ChangeEmail(Principal principal, @RequestParam("email") String email) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		if (appUserService.existsByEmail(email)) {
			return "redirect:/user/profile?status=change_email_fail";
		}
		appUser.setEmail(email);
		appUserService.save(appUser);
		return "redirect:/user/profile?status=change_email_success";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER')")
	@GetMapping("/active/email")
	public String ActiveEmail(Principal principal) throws AddressException, MessagingException {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		
		Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000;
        String verifyCode = Integer.toString(randomNumber);
		appUser.setVerifyCode(verifyCode);
		appUserService.save(appUser);
		
		String linkVerify = "http://localhost:8080/Mock_Project_JFS23_10/user/active/email/check?verifyCode="+verifyCode+"&username="+appUser.getUsername();
        SendMail.sendLinkActiveEmail(appUser.getEmail(), linkVerify);
		return "redirect:/user/profile?status=send_active_code";
	}
	
	@GetMapping("/active/email/check")
	public String CheckVerifyEmail(@RequestParam("verifyCode") String verifyCode, @RequestParam("username") String username) {
		AppUser appUser = appUserService.findByUsername(username);
		if (appUser == null || !appUser.getVerifyCode().equals(verifyCode)) {
			return "error_404";
		}
		
		appUser.setStatus(1);
		appUser.setVerifyCode(null);
		appUserService.save(appUser);
		return "index";
	}
}
