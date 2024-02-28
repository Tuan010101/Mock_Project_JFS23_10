package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
}
