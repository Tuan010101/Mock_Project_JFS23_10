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
public class ContactController {

	@Autowired
	ContactService contactService;

	@GetMapping("/contact")
	public String showContact(@ModelAttribute("contact") Contact contact) {
		return "contact";
	}

	@PostMapping("/contact")
	public String addContact(@ModelAttribute("contact") @Valid Contact contact, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("success", "false");
			return "contact";
		}

		try {
			SendMail.sendContact(contact);
		} catch (MessagingException e) {
			e.printStackTrace();
			model.addAttribute("success", "false");
			return "contact";
		}

		contact.setCreatedDate(LocalDate.now());
		contactService.save(contact);

		model.addAttribute("success", "true");
		model.addAttribute("contact", new Contact());
		return "contact";
	}

}
