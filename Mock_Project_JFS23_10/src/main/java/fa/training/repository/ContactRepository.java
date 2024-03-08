package fa.training.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Contact;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Integer> {
	Page<Contact> findAllByfullNameContainsOrEmailContainsOrSubjectContainsOrderByRepliedAsc(String fullName,
			String email, String subject, Pageable pageable);
}
