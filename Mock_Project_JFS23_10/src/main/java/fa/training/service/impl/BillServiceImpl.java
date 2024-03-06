package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import fa.training.entities.Bill;
import fa.training.repository.BillRepository;
import fa.training.service.BillService;
@Service
public class BillServiceImpl implements BillService {
	@Autowired
	BillRepository billRepository;
	
	@Override
	public List<Bill> findAll() {
		return billRepository.findAll();
	}

	@Override
	public Page<Bill> findByPage(int page) {
		PageRequest pageRequest = PageRequest.of(page, 5);
		return billRepository.findAll(pageRequest);
	}
	
}
