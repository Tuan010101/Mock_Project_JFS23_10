package fa.training.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.AppUser;
import fa.training.entities.Bill;
import fa.training.entities.Product;
import fa.training.entities.UserProduct;
import fa.training.entities.UserRole;
import fa.training.service.AppUserService;
import fa.training.service.BillService;
import fa.training.service.UserProductService;
import fa.training.service.UserRoleService;

@Controller
public class HistoryController {
	
	@Autowired
	AppUserService appUserService;
	
	@Autowired
	private BillService billService;
	
	@GetMapping("/user/history")
	public String GetUserHistory(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Principal principal) {
		AppUser appUser = appUserService.findByUsername(principal.getName());
		
		int pageSize = 4;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Bill> billPage = billService.findAllByUserProductsUserId(appUser, pageable);
		List<Bill> bills = billPage.getContent();
		
		model.addAttribute("bills", bills);
		model.addAttribute("billPage", billPage);
		return "historyUser";
	}
	
	@PostMapping("/user/history/delete/bill/{billId}")
	public String DeleteBill(@PathVariable int billId) {
		Bill bill = billService.findByBillId(billId);
		if (bill == null) {
			return "redirect:/user/history?status=cancel_fail";
		}
		bill.setStatus(6);
		billService.save(bill);
		return "redirect:/user/history?status=cancel_success";
	}
}
