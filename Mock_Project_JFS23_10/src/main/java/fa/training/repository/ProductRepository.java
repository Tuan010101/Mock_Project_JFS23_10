package fa.training.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Category;
import fa.training.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	Page<Product> findAllByProductNameContains(String productName, Pageable pageable);

	Page<Product> findAllByCategoryIdAndProductNameContainingAndDeletedFalseOrderByProductId(Category category, String productName,
			Pageable pageable);

	Page<Product> findAllByProductNameContainingAndDeletedFalseOrderByProductId(String productName, Pageable pageable);

	List<Product> findAllByCategoryIdAndProductIdNotAndDeletedFalse(Category category, int productId);

	List<Product> findAllByDeletedFalse();
	
}
