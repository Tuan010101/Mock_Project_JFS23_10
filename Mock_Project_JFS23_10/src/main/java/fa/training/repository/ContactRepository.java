package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fa.training.entities.Contact;

public interface ContactRepository extends JpaRepository<Contact, Integer> {

}
