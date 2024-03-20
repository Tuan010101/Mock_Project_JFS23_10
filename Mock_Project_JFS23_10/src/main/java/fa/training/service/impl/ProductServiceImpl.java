package fa.training.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Category;
import fa.training.entities.Product;
import fa.training.entities.UserProduct;
import fa.training.repository.ProductRepository;
import fa.training.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;

	@Override
	public void save(Product product) {
		productRepository.save(product);
	}

	@Override
	public Product findById(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Page<Product> findAllByCategoryIdAndProductNameContainingAndDeletedFalseOrderByProductId(Category category,
			String keyword, Pageable pageable) {
		return productRepository.findAllByCategoryIdAndProductNameContainingAndDeletedFalseOrderByProductId(category,
				keyword, pageable);
	}

	@Override
	public Page<Product> findAllByProductNameContainingAndDeletedFalseOrderByProductId(String keyword,
			Pageable pageable) {
		return productRepository.findAllByProductNameContainingAndDeletedFalseOrderByProductId(keyword, pageable);
	}

	@Override
	public List<Product> findAllByCategoryIdAndProductIdNotAndDeletedFalse(Category category, int productId) {
		Product product = findById(productId);
		Category categoryid = product.getCategoryId();
		// Retrieve related products excluding the current product
		return productRepository.findAllByCategoryIdAndProductIdNotAndDeletedFalse(categoryid, productId);
	}

	// Hiển thị mix product ở trang index, indexController
	@Override
	public List<Product> getMixedProducts() {
		// Fetch all products from the database
		List<Product> allProducts = productRepository.findAllByDeletedFalse();

		// Group products by category
		Map<Category, List<Product>> productsByCategory = allProducts.stream()
				.collect(Collectors.groupingBy(Product::getCategoryId));

		// Mix products from different categories
		List<Product> mixedProducts = new ArrayList<>();

		// For simplicity, let's select up to 2 products from each category
		for (Entry<Category, List<Product>> entry : productsByCategory.entrySet()) {
			List<Product> productsFromCategory = entry.getValue();
			mixedProducts.addAll(productsFromCategory.stream().limit(2).collect(Collectors.toList()));
		}
		return mixedProducts;
	}

	@Override
	public Page<Product> findAllByProductNameContains(String productName, Pageable pageable) {
		return productRepository.findAllByProductNameContains(productName, pageable);
	}

	@Override
	public void delete(Product product) {
		productRepository.delete(product);
	}

	@Override
	public List<Product> findAllByDeletedFalse() {
		return productRepository.findAllByDeletedFalse();
	}

	@Override
	public void saveAll(Set<Product> products) {
		productRepository.saveAll(products);
	}
}