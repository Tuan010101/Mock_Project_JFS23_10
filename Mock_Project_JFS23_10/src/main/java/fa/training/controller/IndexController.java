package fa.training.controller;

import java.time.LocalDate;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import fa.training.common.SendMail;
import fa.training.entities.Contact;
import fa.training.service.ContactService;

@Controller
public class IndexController {

	@Autowired
	ContactService contactService;

	@GetMapping(value = { "/", "/index" })
	public String Home() {
		return "index";
	}

	@GetMapping("/about")
	public String About() {
		return "about";
	}

	@GetMapping("/cart")
	public String Cart() {
		return "cart";
	}

	@GetMapping("/checkout")
	public String Checkout() {
		return "checkout";
	}

	@GetMapping("/contact")
	public String showContact(@ModelAttribute("contact") Contact contact) {
		return "contact";
	}

	@PostMapping("/contact")
	public String addContact(@ModelAttribute("contact") @Valid Contact contact, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("success", "false");
			return "contact";
		}

		try {
			SendMail.sendContact(contact);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		contact.setCreatedDate(LocalDate.now());
		contactService.save(contact);
		
		model.addAttribute("success", "true");
		model.addAttribute("contact", new Contact());
		return "contact";
	}

	@GetMapping("/product-single")
	public String ProductSingle() {
		return "product-single";
	}

	@GetMapping("/shop")
	public String Shop() {
		return "shop";
	}
}
