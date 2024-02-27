package fa.training.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import fa.training.entities.AppUser;
import fa.training.repository.RoleRepository;
import fa.training.repository.AppUserRepository;

@Service
public class UserDetailServiceImpl implements UserDetailsService{

	@Autowired
	private AppUserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AppUser appUser = userRepository.findByUsername(username);
		if (appUser == null) {
			throw new UsernameNotFoundException(
			"User " + username + " was not found in the database");
		}
		// [ROLE_USER, ROLE_ADMIN,..]
		List<String> roleNames = userRepository.findByRoleName(appUser.getUserId());
		List<GrantedAuthority> grantList = new ArrayList<>();
		if (roleNames != null) {
			for (String role : roleNames) {
				// ROLE_USER, ROLE_ADMIN,..
				GrantedAuthority authority = new SimpleGrantedAuthority(role);
				grantList.add(authority);
			}
		}
		UserDetails userDetails = (UserDetails) new
			User(appUser.getUsername(), appUser.getEncryptedPassword(),
				grantList);
		return userDetails;
	}

}
