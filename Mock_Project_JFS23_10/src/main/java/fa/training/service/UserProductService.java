package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.AppUser;
import fa.training.entities.Product;
import fa.training.entities.UserProduct;

public interface UserProductService {
	public void save(UserProduct exitingUserProduct);

	public List<UserProduct> findAll();

	public Page<UserProduct> findAll(Pageable pageable);

	public List<UserProduct> findAllByBillIdBillId(int billId);

	public List<UserProduct> findAllByUserIdUsernameAndBillIdBillId(String userName, int billId);

	public List<UserProduct> findAllByUserIdAndBillId(int id);

	public UserProduct findByProductIdProductIdAndUserIdAndBillIdIsNull(int productId, AppUser user);

}
