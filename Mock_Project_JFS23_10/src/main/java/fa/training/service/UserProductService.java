package fa.training.service;


import java.util.List;

import fa.training.entities.UserProduct;


public interface UserProductService {
	public List<UserProduct> findAll();
	public List<UserProduct> findAllByBillId(int billId);
}
