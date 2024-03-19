package fa.training.service;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.entities.Product;
public interface ProductService {

	void save(Product product);

	Product findById(int id);

	List<Product> findAllByDeletedFalse();

	Page<Product> findAllByCategoryIdAndProductNameContainingAndDeletedFalseOrderByProductId(Category category,
			String keyword, Pageable pageable);

	Page<Product> findAllByProductNameContainingAndDeletedFalseOrderByProductId(String productName, Pageable pageable);

	List<Product> findAllByCategoryIdAndProductIdNotAndDeletedFalse(Category category, int productId);

	List<Product> getMixedProducts();

	Page<Product> findAllByProductNameContains(String productName, Pageable pageable);

	void delete(Product product);

	List<Product> findAll();

	void saveAll(Set<Product> products);

}
