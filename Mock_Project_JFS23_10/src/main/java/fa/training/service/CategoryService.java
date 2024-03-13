package fa.training.service;

import java.util.List;

import fa.training.entities.Category;

public interface CategoryService {

	 List<Category> getAllCategory();

	/**
	 * @author: NamLV
	 * @param id 
	 * @DoB: 1998/08/29
	 */
	Category findByCategoryId(int id);

	/**
	 * @author: NamLV
	 * @DoB: 1998/08/29
	 */
	Category findById(int categoryId);
}
