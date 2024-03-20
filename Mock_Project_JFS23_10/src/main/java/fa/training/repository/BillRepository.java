package fa.training.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entities.AppUser;
import fa.training.entities.Bill;

@Repository
public interface BillRepository extends JpaRepository<Bill, Integer> {
	List<Bill> findAll();

	Page<Bill> findAll(Pageable pageable);

	Bill findAllByBillId(int billId);

	Page<Bill> findAllByUserProductsUserIdUsername(String userName, Pageable pageable);

	void deleteByBillId(int billId);
	
	@EntityGraph(attributePaths = {"userProducts"})
	Page<Bill> findAllByUserProductsUserId(AppUser appUser, Pageable pageable);
	
	Bill findByBillId(int billId);

	Page<Bill> findAllByFullNameContains(String fullNanme, Pageable pageable);
}
