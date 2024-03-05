package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	Category findByCategoryId(int id);
	
	Category findById(int categoryId);
}
