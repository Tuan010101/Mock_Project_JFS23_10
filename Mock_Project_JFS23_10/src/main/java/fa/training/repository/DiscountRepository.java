package fa.training.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Discount;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Integer> {
	Page<Discount> findAllByDiscountNameContains(String DiscountName, Pageable pageable);


	Page<Discount> findAllByDiscountNameContainingAndDeletedFalseOrderByDiscountId(String DiscountName, Pageable pageable);

	
	List<Discount> findAllByDeletedFalse();

}
