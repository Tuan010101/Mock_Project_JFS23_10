package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.UserRole;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

}
