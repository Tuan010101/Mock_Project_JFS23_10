package fa.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.AppUser;
import fa.training.repository.AppUserRepository;
import fa.training.service.AppUserService;
@Service
public class AppUserServiceImpl implements AppUserService {
	
	@Autowired
	AppUserRepository appUserRepository;

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

}
