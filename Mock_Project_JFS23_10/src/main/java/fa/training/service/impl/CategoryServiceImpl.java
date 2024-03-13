package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.repository.CategoryRepository;
import fa.training.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired 
	private CategoryRepository categoryRepository;

	@Override
	public List<Category> getAllCategory() {
		return categoryRepository.findAll();
	}

	@Override
	public Category findByCategoryId(int id) {
		return categoryRepository.findByCategoryId(id);
	}

	@Override
	public Category findById(int categoryId) {
		return categoryRepository.findById(categoryId);
	}
	
	
	
}
