package fa.training.service;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.entities.Product;
@Service
public interface ProductService {

	Product save(Product product);
	Product findById(int id);
	/**
	 * @author: NamLV
	 * @DoB: 1998/08/29
	 */
	List<Product> findAll();
	/**
	 * @author: NamLV
	 * @DoB: 1998/08/29
	 */
	Page<Product> findAllByCategoryIdAndProductNameContainingOrderByProductId(Category category, String keyword,
			Pageable pageable);
	/**
	 * @author: NamLV
	 * @DoB: 1998/08/29
	 */
	Page<Product> findAllByProductNameContainingOrderByProductId(String keyword, Pageable pageable);





}
