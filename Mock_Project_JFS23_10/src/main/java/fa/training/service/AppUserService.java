package fa.training.service;

import fa.training.entities.AppUser;

public interface AppUserService {
	boolean existsByUsername(String username);

	boolean existsByEmail(String email);

	void save(AppUser saveAppUser);

	boolean existsByEmailAndStatus(String email, int i);

	AppUser findByUsername(String name);

	AppUser findByEmail(String email);
}
