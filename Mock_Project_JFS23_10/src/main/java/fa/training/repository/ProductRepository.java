package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
