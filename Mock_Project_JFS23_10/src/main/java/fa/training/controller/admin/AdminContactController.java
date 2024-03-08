package fa.training.controller.admin;

import javax.mail.MessagingException;
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

import fa.training.common.SendMail;
import fa.training.entities.Contact;
import fa.training.form.ReplyEmailContactForm;
import fa.training.service.ContactService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminContactController {

	@Autowired
	ContactService contactService;

	@GetMapping("/contacts")
	public String showAllContacts(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<Contact> contacts = contactService
				.findAllByfullNameContainsOrEmailContainsOrSubjectContainsOrderByRepliedAsc(keyword, keyword, keyword,
						pageable);

		for (Contact contact : contacts.getContent()) {
			if (contact.getMessage().length() > 30) {
				contact.setMessage(contact.getMessage().substring(0, 30) + "...");
			}
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("contacts", contacts);

		return "admin/contact/list";
	}

	@GetMapping("/contacts/{id}")
	public String showOneContacts(@PathVariable int id, Model model) {
		Contact contact = contactService.findById(id);

		model.addAttribute("contact", contact);

		return "admin/contact/detail";
	}

	@GetMapping("/contacts/reply/{id}")
	public String showReplyContacts(@PathVariable int id,
			@ModelAttribute("replyEmailContactForm") ReplyEmailContactForm replyEmailContactForm, Model model) {
		Contact contact = contactService.findById(id);

		replyEmailContactForm.setEmail(contact.getEmail());
		replyEmailContactForm.setSubject("Re: " + contact.getSubject());

		return "admin/contact/reply";
	}

	@PostMapping("/contacts/reply/{id}")
	public String doReplyContacts(@PathVariable int id,
			@ModelAttribute("replyEmailContactForm") @Valid ReplyEmailContactForm replyEmailContactForm,
			BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "admin/contact/reply";
		}

		Contact contact = contactService.findById(id);
		contact.setReplied(true);
		contactService.save(contact);

		try {
			SendMail.sendHTML(replyEmailContactForm.getEmail(), replyEmailContactForm.getSubject(),
					replyEmailContactForm.getMessage());
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "redirect:/admin/contacts";

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
