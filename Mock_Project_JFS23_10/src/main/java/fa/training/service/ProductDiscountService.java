package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.Discount;
import fa.training.entities.ProductDiscount;

public interface ProductDiscountService {

	ProductDiscount findById(int id);

	void save(ProductDiscount saveProductDiscount);

	Page<ProductDiscount> findAllByProductDiscountnameContains(String keyword, Pageable pageable);

	List<ProductDiscount> findAll();

}