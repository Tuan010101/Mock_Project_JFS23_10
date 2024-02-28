package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

}
