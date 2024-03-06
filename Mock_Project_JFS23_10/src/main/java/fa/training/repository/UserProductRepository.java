package fa.training.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entities.UserProduct;

@Repository
public interface UserProductRepository extends JpaRepository<UserProduct, Integer> {
	
//	@Query("SELECT * FROM UserProduct AS UP WHERE UP.product_id = ?1")
//	public List<UserProduct> findAllByBillId(int billId);
}
