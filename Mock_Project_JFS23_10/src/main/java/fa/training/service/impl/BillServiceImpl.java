package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.AppUser;
import fa.training.entities.Bill;
import fa.training.entities.Product;
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

	@Override
	public void save(Bill bill) {
		billRepository.save(bill);
	}

	/**
	 * @author Vinh 18/3/2023
	 */
	@Override
	public void deleteByBillId(int billId) {
		billRepository.deleteByBillId(billId);
	}

	@Override
	public Page<Bill> findAllByUserProductsUserId(AppUser appUser, Pageable pageable) {
		return billRepository.findAllByUserProductsUserId(appUser, pageable);
	}

	@Override
	public Bill findByBillId(int billId) {
		return billRepository.findByBillId(billId);
	}

	@Override
	public Bill findById(int id) {
		// TODO Auto-generated method stub
		return billRepository.findById(id).get();
	}

	@Override
	public Page<Bill> findAllByFullNameContains(String fullName, Pageable pageable) {
		return billRepository.findAllByFullNameContains(fullName, pageable);
	}

}
