package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.Account;

public interface UserRepository extends JpaRepository<Account, Integer> {

}
