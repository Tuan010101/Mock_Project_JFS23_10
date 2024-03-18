package fa.training.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Discount;
import fa.training.entities.ProductDiscount;

@Repository
public interface ProductDiscountRepository extends JpaRepository<ProductDiscount, Integer> {
	Page<ProductDiscount> findAllByProductDiscountIdContains(Integer productDiscountId, Pageable pageable);

	List<ProductDiscount> findAll();

}
