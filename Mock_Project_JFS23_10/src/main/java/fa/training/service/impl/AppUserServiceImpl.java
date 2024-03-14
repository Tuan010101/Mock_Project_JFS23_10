package fa.training.service.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fa.training.entities.AppUser;
import fa.training.repository.AppUserRepository;
import fa.training.service.AppUserService;

@Service
public class AppUserServiceImpl implements AppUserService {

	@Autowired
	AppUserRepository appUserRepository;

	@Override
	public AppUser findByUsername(String username) {
		return appUserRepository.findByUsername(username);
	}

	@Override
	public boolean existsByUsername(String username) {
		return appUserRepository.existsByUsername(username);
	}

	@Override
	public void save(AppUser saveAppUser) {
		appUserRepository.save(saveAppUser);
	}

	@Override
	public boolean existsByEmail(String email) {
		return appUserRepository.existsByEmail(email);
	}

	@Override
	public boolean existsByEmailAndStatus(String email, int i) {
		return appUserRepository.existsByEmailAndStatus(email, i);
	}

	@Override
	public AppUser findByEmail(String email) {
		return appUserRepository.findByEmail(email);
	}

	@Override
	public Page<AppUser> findAllByUsernameContains(String keyword, Pageable pageable) {
		return appUserRepository.findAllByUsernameContains(keyword, pageable);
	}

	@Override
	public List<AppUser> findAll() {
		return appUserRepository.findAll();
	}

	@Override
	@Transactional // Mở lại session trước khi truy cập userRoles
	public AppUser findById(int id) {
		AppUser user = appUserRepository.findById(id).orElse(null);
		if (user != null) {
			Hibernate.initialize(user.getUserRoles());
		}
		return user;
	}

}
