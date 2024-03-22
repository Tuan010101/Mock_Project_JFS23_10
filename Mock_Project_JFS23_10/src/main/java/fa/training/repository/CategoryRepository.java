package fa.training.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fa.training.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	Page<Category> findAllByCategoryNameContains(String keyword, Pageable pageable);

	List<Category> findAllByDeletedFalse();

	@Query("SELECT c FROM Category c LEFT JOIN FETCH c.products WHERE c.id = :id")
	Category findByIdWithProducts(@Param("id") int id);

}
