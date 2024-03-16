package fa.training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entities.Contact;
import fa.training.repository.ContactRepository;
import fa.training.service.ContactService;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	ContactRepository contactRepository;

	@Override
	public void save(Contact contact) {
		contactRepository.save(contact);
	}

	@Override
	public Contact findById(int id) {
		return contactRepository.findById(id).get();
	}

	@Override
	public Page<Contact> findAllByfullNameContainsOrEmailContainsOrSubjectContainsOrderByRepliedAsc(String fullName, String email,
			String subject, Pageable pageable) {
		return contactRepository.findAllByfullNameContainsOrEmailContainsOrSubjectContainsOrderByRepliedAsc(fullName, email, subject,
				pageable);
	}

}
