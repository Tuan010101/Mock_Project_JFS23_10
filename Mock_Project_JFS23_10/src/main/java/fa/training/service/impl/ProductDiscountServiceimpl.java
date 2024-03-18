package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.ProductDiscount;
import fa.training.repository.ProductDiscountRepository;
import fa.training.service.ProductDiscountService;

@Service
public class ProductDiscountServiceimpl implements ProductDiscountService {

	@Autowired
	ProductDiscountRepository productDiscountRepository;

	@Override
	public ProductDiscount findById(int id) {
		return productDiscountRepository.findById(id).get();
	}

	@Override
	public void save(ProductDiscount saveDiscount) {
		productDiscountRepository.save(saveDiscount);

	}

	@Override
	public Page<ProductDiscount> findAllByProductDiscountnameContains(String keyword, Pageable pageable) {
		return null;
	}

	@Override
	public List<ProductDiscount> findAll() {
		return null;
	}

}
