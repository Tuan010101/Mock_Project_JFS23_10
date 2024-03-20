package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.AppUser;
import fa.training.entities.UserProduct;

public interface UserProductService {
	public void save(UserProduct userProduct);

	public List<UserProduct> findAll();

	public Page<UserProduct> findAll(Pageable pageable);

	public List<UserProduct> findAllByBillIdBillId(int billId);

	public List<UserProduct> findAllByUserIdUsernameAndBillIdBillId(String userName, int billId);

	public List<UserProduct> findAllByUserIdAndBillIdIsNull(AppUser appUser);

	public UserProduct findByProductIdProductIdAndUserIdAndBillIdIsNull(int productId, AppUser appUser);

	public void delete(UserProduct userProduct);
}
