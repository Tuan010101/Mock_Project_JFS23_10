package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;

import fa.training.entities.Bill;

public interface BillService {
	List<Bill> findAll();
	Page<Bill> findByPage(int page);
}
