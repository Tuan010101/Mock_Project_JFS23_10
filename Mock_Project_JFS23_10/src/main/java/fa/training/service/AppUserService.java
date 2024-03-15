package fa.training.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import fa.training.entities.AppUser;

public interface AppUserService {

	AppUser findById(int id);

	AppUser findByUsername(String username);

	boolean existsByUsername(String username);

	boolean existsByEmail(String email);

	void save(AppUser saveAppUser);

	boolean existsByEmailAndStatus(String email, int i);

	AppUser findByEmail(String email);

	Page<AppUser> findAllByUsernameContains(String keyword, Pageable pageable);

	List<AppUser> findAll();
}
