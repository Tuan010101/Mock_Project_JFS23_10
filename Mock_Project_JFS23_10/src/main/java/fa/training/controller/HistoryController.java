package fa.training.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.Bill;
import fa.training.entities.UserProduct;
import fa.training.entities.UserRole;
import fa.training.service.BillService;
import fa.training.service.UserProductService;
import fa.training.service.UserRoleService;

@Controller
public class HistoryController {
	
	@Autowired
	private UserProductService userProductService;
	
	@Autowired
	private BillService billService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	
	
	@GetMapping("/history")
	public String ShowHistory(Model model, @RequestParam(value = "page", defaultValue = "0") int page, Principal principal) {
		String userName = principal.getName();
		List<UserRole> userRoles = userRoleService.findAllByUserIdUsername(userName);
		String userRole = "";
		if (userRoles.size() == 1) {
			userRole = "user";
		} else {
			userRole = "admin";
		}
		Pageable pageable = PageRequest.of(page, 5);
		String result = "";
		
		if (userRole.equals("admin")) {
			Page<Bill> billpage =  billService.findAll(pageable);
			List<Bill> bills = billpage.getContent();
			int totalBillPage = billpage.getTotalPages();
			
			List<Integer> billIds = new ArrayList<>();
			for (Bill bill : bills) {
				billIds.add(bill.getBillId());
			}
			
			Map<Integer, List<UserProduct>> mapUserProducts = new HashMap<Integer, List<UserProduct>>();
			for (Integer billId : billIds) {
				List<UserProduct> userProducts = userProductService.findAllByBillIdBillId(billId);
				mapUserProducts.put(billId, userProducts);
			}
			model.addAttribute("mapUserProducts", mapUserProducts);
			model.addAttribute("totalUserProductPage", totalBillPage);
			model.addAttribute("billpage", billpage);
			model.addAttribute("bills", bills);
			result = "historyAdmin";
		} else {
			Page<Bill> billpage =  billService.findAllByUserProductsUserIdUsername(userName, pageable);
			List<Bill> bills = billpage.getContent();
			List<Integer> billIds = new ArrayList<>();
			for (Bill bill : bills) {
				billIds.add(bill.getBillId());
			}
			
			Map<Integer, List<UserProduct>> mapUserProducts = new HashMap<Integer, List<UserProduct>>();
			for (Integer billId : billIds) {
				List<UserProduct> userProducts = userProductService.findAllByUserIdUsernameAndBillIdBillId(userName, billId);
				mapUserProducts.put(billId, userProducts);
			}
			int totalBillPage = billpage.getTotalPages();
			model.addAttribute("mapUserProducts", mapUserProducts);
			model.addAttribute("totalBillPage", totalBillPage);
			model.addAttribute("bills",  bills);
			model.addAttribute("billpage",  billpage);
			result = "historyUser";
			
//			org.hibernate.LazyInitializationException: failed to lazily initialize a collection of role: fa.training.entities.Bill.userProducts, could not initialize proxy - no Session
//			Page<Bill> billpage =  billService.findAllByUserProductsUserIdUsername(userName, pageable);
//			List<Bill> bills = billpage.getContent();
//			int totalBillPage = billpage.getTotalPages();
//			model.addAttribute("totalBillPage", totalBillPage);
//			model.addAttribute("bills",  bills);
//			model.addAttribute("billpage",  billpage);
//			result = "historyUser";
		}
		return result;
	}
}
