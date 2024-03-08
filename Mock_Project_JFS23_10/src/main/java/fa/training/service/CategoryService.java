package fa.training.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.Category;

public interface CategoryService {

	Page<Category> findAllByCategoryNameContains(String keyword, Pageable pageable);

	Category findById(int id);

	void save(Category category);

	void delete(Category category);

}
