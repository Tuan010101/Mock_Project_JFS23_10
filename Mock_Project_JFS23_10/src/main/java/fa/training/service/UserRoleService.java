package fa.training.service;

import java.util.List;

import fa.training.entities.UserRole;

public interface UserRoleService {

	void save(UserRole userRole);
	List<UserRole> findAllByUserIdUsername(String userName);

	List<UserRole> findAll();

}
