package fa.training.service;

import fa.training.entities.AppUser;

public interface AppUserService {

	AppUser findByUsername(String username);

	boolean existsByUsername(String username);

	boolean existsByEmail(String email);

	void save(AppUser saveAppUser);

}
