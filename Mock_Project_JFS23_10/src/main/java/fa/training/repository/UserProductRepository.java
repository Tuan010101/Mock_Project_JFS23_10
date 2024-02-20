package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.UserProduct;

public interface UserProductRepository extends JpaRepository<UserProduct, Integer> {

}
