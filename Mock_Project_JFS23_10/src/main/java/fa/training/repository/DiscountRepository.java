package fa.training.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Discount;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Integer> {

	// Trong DiscountRepository
	List<Discount> findAll();

	Page<Discount> findByStartDiscountDate(LocalDate startDiscountDate, Pageable pageable);

	Page<Discount> findAll(Pageable pageable);

	Page<Discount> findByDiscountPercent(Pageable pageable, int discountPercent);
}
