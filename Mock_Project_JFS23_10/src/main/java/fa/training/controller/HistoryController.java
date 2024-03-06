package fa.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.Bill;
import fa.training.service.BillService;

@Controller
public class HistoryController {
	@Autowired
	private BillService billService;
	
//	@Autowired
//	private UserProductService userProductService;

	
	
	@GetMapping("/history")
	public String ShowHistory(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		Page<Bill> bills = billService.findByPage(page);
		
//		List<UserProduct> userProducts = userProductService.findAllByBillId();
		
		model.addAttribute("bills",  bills.getContent());
		
		return "history";
	}
//	@GetMapping("/cart")
//	public String Cart() {
//		return "cart";
//	}

//	@PostMapping("/upload")
//	public String doCreate(@Valid @ModelAttribute Person person, BindingResult errors) {
//		personValidate.validate(person, errors);
//		if (errors.hasErrors()) {
//			return "person/create";
//		}
//		personService.save(person);
//		return "redirect:create.jsp";
//	}
}
