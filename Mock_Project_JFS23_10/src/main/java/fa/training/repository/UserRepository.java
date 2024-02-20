package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
