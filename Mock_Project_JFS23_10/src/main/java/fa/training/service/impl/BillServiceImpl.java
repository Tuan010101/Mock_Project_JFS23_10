package fa.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.Bill;
import fa.training.repository.BillRepository;
import fa.training.service.BillService;
@Service
public class BillServiceImpl implements BillService {

	@Autowired
	BillRepository billRepository;
	
	@Override
	public void save( Bill bill) {
		billRepository.save(bill);
		
	}

}
