package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Category;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
