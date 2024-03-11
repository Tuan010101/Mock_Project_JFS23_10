package fa.training.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.Product;

public interface ProductService {

	Page<Product> findAllByProductNameContains(String productName, Pageable pageable);

	void save(Product product);

	Product findById(int id);

	void delete(Product product);

}
