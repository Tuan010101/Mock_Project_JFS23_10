package fa.training.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.entities.Product;
import fa.training.repository.ProductRepository;
import fa.training.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Product save(Product product) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product findById(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public Page<Product> findAllByCategoryIdAndProductNameContainingOrderByProductId(Category category, String keyword,
			Pageable pageable) {
		return productRepository.findAllByCategoryIdAndProductNameContainingOrderByProductId(category, keyword,
				pageable);
	}

	@Override
	public Page<Product> findAllByProductNameContainingOrderByProductId(String keyword, Pageable pageable) {
		return productRepository.findAllByProductNameContainingOrderByProductId(keyword, pageable);
	}

}
