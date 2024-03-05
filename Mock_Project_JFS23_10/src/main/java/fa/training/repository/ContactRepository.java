package fa.training.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.training.entities.Contact;
@Repository
public interface ContactRepository extends JpaRepository<Contact, Integer> {

}
