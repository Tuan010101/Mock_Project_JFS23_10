package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.entities.Product;

@Service
public interface ProductService {

	void save(Product product);

	Product findById(int id);

	List<Product> findAllByDeletedFalse();

	Page<Product> findAllByCategoryIdAndProductNameContainingAndDeletedFalseOrderByProductId(Category category, String keyword,
			Pageable pageable);

	Page<Product> findAllByProductNameContainingAndDeletedOrderByProductId(String productName,boolean deleted, Pageable pageable);

	List<Product> findAllByCategoryIdAndProductIdNot(Category category, int productId);

	List<Product> getMixedProducts();

	Page<Product> findAllByProductNameContains(String productName, Pageable pageable);


	void delete(Product product);

	/**
	 * @author: NamLV
	 * @DoB: 1998/08/29
	 */
	List<Product> findAll();

}
