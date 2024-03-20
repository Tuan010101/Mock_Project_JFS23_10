package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.AppUser;
import fa.training.entities.UserProduct;
import fa.training.repository.UserProductRepository;
import fa.training.service.UserProductService;
@Service
public class UserProductServiceImpl implements UserProductService {
	@Autowired
	private UserProductRepository userProductRepository;

	@Override
	public List<UserProduct> findAll() {
		return userProductRepository.findAll();
	}

	@Override
	public List<UserProduct> findAllByBillIdBillId(int billId) {
		return userProductRepository.findAllByBillIdBillId(billId);
	}

	
	@Override
	public List<UserProduct> findAllByUserIdUsernameAndBillIdBillId(String userName, int billId) {
		// TODO Auto-generated method stub
		return userProductRepository.findAllByUserIdUsernameAndBillIdBillId(userName, billId);
	}


	@Override
	public Page<UserProduct> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return userProductRepository.findAll(pageable);
	}

	@Override
	public List<UserProduct> findAllByUserIdAndBillIdIsNull(AppUser appUser) {
		return userProductRepository.findAllByUserIdAndBillIdIsNull(appUser);
	}

	@Override
	public List<UserProduct> findAllByUserIdAndBillIdNotNull(AppUser appUser) {
		return userProductRepository.findAllByUserIdAndBillIdNotNull(appUser);
	}

}
