package fa.training.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entities.AppUser;
import fa.training.entities.UserProduct;

@Repository
public interface UserProductRepository extends JpaRepository<UserProduct, Integer> {
	
//	@Query("SELECT * FROM UserProduct AS UP WHERE UP.product_id = ?1")
//	public List<UserProduct> findAllByBillId(int billId);
	List<UserProduct> findAllByBillIdBillId(int billId);
	Set<UserProduct> findByUserIdAndBillId(int userId, String billId);
	List<UserProduct> findAllByUserIdUsernameAndBillIdBillId(String userName, int billId);
	Page<UserProduct> findAll(Pageable pageable);
	
	List<UserProduct> findAllByUserIdAndBillIdIsNull(AppUser appUser);
	List<UserProduct> findAllByUserIdAndBillIdNotNull(AppUser appUser);	
}
