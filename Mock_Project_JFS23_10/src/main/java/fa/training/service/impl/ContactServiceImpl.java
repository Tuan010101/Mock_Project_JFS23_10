package fa.training.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
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

}
