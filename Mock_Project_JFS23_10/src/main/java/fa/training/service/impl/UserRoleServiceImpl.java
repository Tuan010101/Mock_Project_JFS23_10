package fa.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.UserRole;
import fa.training.repository.UserRoleRepository;
import fa.training.service.UserRoleService;
@Service
public class UserRoleServiceImpl implements UserRoleService{
	
	@Autowired
	UserRoleRepository userRoleRepository;

	@Override
	public void save(UserRole userRole) {
		userRoleRepository.save(userRole);
	}

}
