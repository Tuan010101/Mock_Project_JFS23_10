package fa.training.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entities.AppUser;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Integer> {
	AppUser findByUsername(String userName);

	@Query("SELECT DISTINCT ur.roleId.roleName FROM AppUser u JOIN u.userRoles ur WHERE u.userId = ?1")
	List<String> findByRoleName(int userId);
	
	boolean existsByUsername(String username);

	boolean existsByEmail(String email);
}
