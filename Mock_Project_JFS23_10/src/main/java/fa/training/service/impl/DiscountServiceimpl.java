package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Discount;
import fa.training.repository.DiscountRepository;
import fa.training.service.DiscountService;

@Service
public class DiscountServiceimpl implements DiscountService {

	@Autowired
	DiscountRepository discountRepository;

	@Override
	public Discount findById(int id) {
		return discountRepository.findById(id).get();
	}

	@Override
	public void save(Discount saveDiscount) {
		discountRepository.save(saveDiscount);

	}

	@Override
	public List<Discount> findAll() {
		return discountRepository.findAll();
	}

	@Override
	public Page<Discount> findAll(Pageable pageable) {
		return discountRepository.findAll(pageable);
	}

	@Override
	public Page<Discount> findByPercent(Pageable pageable, int percent) {
		return discountRepository.findByDiscountPercent(pageable, percent);
	}

}
