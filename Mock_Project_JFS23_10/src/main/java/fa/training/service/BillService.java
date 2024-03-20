package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.AppUser;
import fa.training.entities.Bill;
import fa.training.entities.Category;
import fa.training.entities.Product;

@Service
public interface BillService {
	List<Bill> findAll();

	Page<Bill> findAll(Pageable pageable);

	Bill findAllByBillId(int billId);

	Page<Bill> findAllByUserProductsUserIdUsername(String userName, Pageable pageable);

	void save(Bill bill);
	
	/**
	 * @author Vinh
	 * @date 18/3/2023
	 */
	void deleteByBillId(int billId); 
	
	Page<Bill> findAllByUserProductsUserId(AppUser appUser, Pageable pageable);
	
	Bill findByBillId(int billId);
}
