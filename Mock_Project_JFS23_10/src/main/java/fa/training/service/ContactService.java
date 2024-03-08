package fa.training.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fa.training.entities.Contact;

public interface ContactService {

	void save(Contact contact);

	Contact findById(int id);

	Page<Contact> findAllByfullNameContainsOrEmailContainsOrSubjectContainsOrderByRepliedAsc(String fullName, String email,
			String subject, Pageable pageable);

}
