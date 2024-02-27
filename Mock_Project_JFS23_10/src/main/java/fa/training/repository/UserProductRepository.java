package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.UserProduct;

@Repository
public interface UserProductRepository extends JpaRepository<UserProduct, Integer> {

}
