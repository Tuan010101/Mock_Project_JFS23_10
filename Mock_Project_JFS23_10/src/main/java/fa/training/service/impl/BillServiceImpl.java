package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Bill;
import fa.training.repository.BillRepository;
import fa.training.service.BillService;

@Service
public class BillServiceImpl implements BillService {
	@Autowired
	private BillRepository billRepository;
	
	@Override
	public List<Bill> findAll() {
		return billRepository.findAll();
	}
	
	@Override
	public Page<Bill> findAll(Pageable pageable) {
		return billRepository.findAll(pageable);
	}

	@Override
	public Bill findAllByBillId(int billId) {
		return billRepository.findAllByBillId(billId);
	}

	@Override
	public Page<Bill> findAllByUserProductsUserIdUsername(String userName, Pageable pageable) {
		return billRepository.findAllByUserProductsUserIdUsername(userName, pageable);
	}
//	@Query(value = "SELECT * FROM Bill AS B " +
//            "JOIN UserProduct AS UP ON B.bill_id = UP.bill_id " +
//            "JOIN AppUser AS AP ON UP.user_id = AP.user_id " +
//            "WHERE AP.username = :username", countQuery = "SELECT COUNT(*) FROM Bill AS B " +
//            "JOIN UserProduct AS UP ON B.bill_id = UP.bill_id " +
//            "JOIN AppUser AS AP ON UP.user_id = AP.user_id " +
//            "WHERE AP.username = :username", nativeQuery = true)
//Page<Bill> getBillsByUsername(@Param("username") String username, Pageable pageable);
}
