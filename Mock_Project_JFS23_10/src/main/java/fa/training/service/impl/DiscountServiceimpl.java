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
	public Discount findByPercent(String percent) {
		return null;
	}

	@Override
	public Page<Discount> findAllByDiscountnameContains(String keyword, Pageable pageable) {
		return null;
	}

	@Override
	public List<Discount> findAll() {
		return null;
	}

}
