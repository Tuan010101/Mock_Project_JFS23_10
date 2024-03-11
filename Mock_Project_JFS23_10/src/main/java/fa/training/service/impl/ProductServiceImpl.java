package fa.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Product;
import fa.training.repository.ProductRepository;
import fa.training.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;

	@Override
	public Page<Product> findAllByProductNameContains(String productName, Pageable pageable) {
		return productRepository.findAllByProductNameContains(productName, pageable);
	}

	@Override
	public void save(Product product) {
		productRepository.save(product);
	}

	@Override
	public Product findById(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public void delete(Product product) {
		productRepository.delete(product);
	}

}
