package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.Discount;

public interface DiscountService {

	Discount findById(int id);

	void save(Discount saveDiscount);

	List<Discount> findAll();

	Page<Discount> findAll(Pageable pageable);

	Page<Discount> findByPercent(Pageable pageable, int percent);

}