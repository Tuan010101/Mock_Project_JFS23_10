package fa.training.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.config.ConfigPayment;
import fa.training.entities.AppUser;
import fa.training.entities.Bill;
import fa.training.entities.Product;
import fa.training.entities.UserProduct;
import fa.training.service.AppUserService;
import fa.training.service.BillService;
import fa.training.service.UserProductService;

@Controller
public class PaymentController {

	@Autowired
	AppUserService appUserService;
	@Autowired
	BillService billService;
	@Autowired
	UserProductService userProductService;

	private boolean isInDiscountPeriod(LocalDate currentDate, LocalDate startDate, LocalDate endDate) {
		return !currentDate.isBefore(startDate) && !currentDate.isAfter(endDate);
	}

	private double getTotalPrice(AppUser appUser) {
		LocalDate today = LocalDate.now();
		double totalPrice = appUser.getUserProducts().stream().filter(userProduct -> userProduct.getBillId() == null)
				.mapToDouble(userProduct -> {

					Product product = userProduct.getProductId();

					double maxDiscountPercent = product.getProductDiscounts().stream().filter(productDiscount -> {
						LocalDate startDate = productDiscount.getDiscount().getStartDiscountDate();
						LocalDate endDate = productDiscount.getDiscount().getEndDiscountDate();
						return isInDiscountPeriod(today, startDate, endDate);
					}).mapToDouble(productDiscount -> productDiscount.getDiscount().getDiscountPercent()).max()
							.orElse(0.0);

					return product.getPrice() * (1 - maxDiscountPercent / 100.0) * userProduct.getQuantity();
				}).sum();

		DecimalFormat decimalFormat = new DecimalFormat("#.##");
		totalPrice = Double.parseDouble(decimalFormat.format(totalPrice));
		return totalPrice;
	}

	@GetMapping("/checkout")
	public String showCheckout(@ModelAttribute("bill") Bill bill, Principal principal, Model model) {

		String username = principal.getName();
		AppUser appUser = appUserService.findByUsername(username);

		int sizeBill = (int) appUser.getUserProducts().stream().filter(userProduct -> userProduct.getBillId() == null)
				.count();

		if (sizeBill == 0) {
			return "redirect:/cart";
		}

		bill.setFullName(appUser.getFullName());
		bill.setAddress(appUser.getAddress());
		bill.setPhoneNumber(appUser.getPhoneNumber());
		bill.setEmail(appUser.getEmail());

		model.addAttribute("totalPrice", getTotalPrice(appUser));
		return "checkout";

	}

	@PostMapping("/checkout")
	public String doCheckout(@ModelAttribute("bill") @Valid Bill bill, BindingResult bindingResult, Principal principal,
			Model model, HttpSession session) {
		String username = principal.getName();
		AppUser appUser = appUserService.findByUsername(username);

		if (bindingResult.hasErrors()) {
			model.addAttribute("success", "false");
			model.addAttribute("totalPrice", getTotalPrice(appUser));
			return "checkout";
		}
		// status :
		// 0 : chờ xác nhận
		// 1 : chờ lấy hàng
		// 2 : đang giao
		// 3 : giao thành công
		// 4 : giao thất bại
		// 5 : hủy đơn

		// payment_method
		// 0 : COD
		// 1 : VNPAY

		Set<UserProduct> setUserProducts = appUser.getUserProducts().stream()
				.filter(userProduct -> userProduct.getBillId() == null).collect(Collectors.toSet());

		bill.setStatus(0);
		bill.setBuyDate(LocalDate.now());
		bill.setBuyTime(LocalTime.now());

		if (bill.getPaymentMethod() == 0) {

			billService.save(bill);

			System.out.println(bill.getBillId());

			for (UserProduct userProduct : setUserProducts) {
				userProduct.setBillId(bill);
			}

			appUser.setUserProducts(setUserProducts);
			appUserService.save(appUser);

			return "redirect:/cart?pay_status=success";
		} else {
			session.setAttribute("bill", bill);
			return "redirect:/create_payment";
		}

	}

	@GetMapping("/create_payment")
	public String createPayment(HttpServletRequest req, Principal principal) throws IOException {

		String username = principal.getName();
		AppUser appUser = appUserService.findByUsername(username);

		long amount = (long) (getTotalPrice(appUser) * 100 * 23000);
		// * 100 : quy định VNPAY
		// * 23000 : $ -> VND

		String vnp_TxnRef = ConfigPayment.getRandomNumber(8);
		String vnp_IpAddr = ConfigPayment.getIpAddress(req);

		String vnp_TmnCode = ConfigPayment.vnp_TmnCode;

		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", ConfigPayment.vnp_Version);
		vnp_Params.put("vnp_Command", ConfigPayment.vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_BankCode", "NCB");
		vnp_Params.put("vnp_CurrCode", "VND");
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
		vnp_Params.put("vnp_Locale", "vn");
		vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
		vnp_Params.put("vnp_OrderType", ConfigPayment.orderType);
		vnp_Params.put("vnp_ReturnUrl", ConfigPayment.vnp_ReturnUrl);
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);

		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		cld.add(Calendar.MINUTE, 15);
		String vnp_ExpireDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = ConfigPayment.hmacSHA512(ConfigPayment.secretKey, hashData.toString());
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = ConfigPayment.vnp_PayUrl + "?" + queryUrl;
//		com.google.gson.JsonObject job = new JsonObject();
//		job.addProperty("code", "00");
//		job.addProperty("message", "success");
//		job.addProperty("data", paymentUrl);
//		Gson gson = new Gson();
//		resp.getWriter().write(gson.toJson(job));

		System.out.println(paymentUrl);
		return "redirect:" + paymentUrl;
	}

	@GetMapping("/return_payment")
	public String returnPayment(@RequestParam(value = "vnp_ResponseCode") String responseCode, HttpSession session,
			Principal principal) {

		if (responseCode.equals("00")) {

			Bill bill = (Bill) session.getAttribute("bill");
			session.removeAttribute("bill");
			billService.save(bill);
			System.out.println(bill.getBillId());

			String username = principal.getName();
			AppUser appUser = appUserService.findByUsername(username);
			Set<UserProduct> setUserProducts = appUser.getUserProducts().stream()
					.filter(userProduct -> userProduct.getBillId() == null).collect(Collectors.toSet());

			for (UserProduct userProduct : setUserProducts) {
				userProduct.setBillId(bill);
			}

			appUser.setUserProducts(setUserProducts);
			appUserService.save(appUser);

			return "redirect:/cart?pay_status=success";

		} else {
			return "redirect:/checkout";
		}

	}

}
