package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.repository.CategoryRepository;
import fa.training.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

	@Override
	public void save(Category category) {
		categoryRepository.save(category);
	}

	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Page<Category> findAllByCategoryNameContains(String keyword, Pageable pageable) {
		return categoryRepository.findAllByCategoryNameContains(keyword, pageable);
	}

	@Override
	public Category findById(int categoryId) {
		return categoryRepository.findByIdWithProducts(categoryId);
	}

	@Override
	public void delete(Category category) {
		categoryRepository.delete(category);
	}

	@Override
	public List<Category> findAllByDeletedFalse() {
		return categoryRepository.findAllByDeletedFalse();
	}

}
