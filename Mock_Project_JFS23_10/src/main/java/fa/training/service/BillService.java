package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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

	void deleteByBillId(int billId);

	void updateBill(int billId);

	Bill findById(int id);

	Page<Bill> findAllByFullNameContains(String fullName, Pageable pageable);

}
