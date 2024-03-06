package fa.training.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Contact {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "contact_id")
	private int contactId;
	
	@Column(name = "full_name")
	@NotBlank(message = "Must not be blank")
	private String fullName;
	
	@NotBlank(message = "Must not be blank")
	@Email(message = "Must be a well-formed email address")
	private String email;
	
	@NotBlank(message = "Must not be blank")
	private String subject;
	
	@NotBlank(message = "Must not be blank")
	private String message;
	
	@Column(name = "created_date")
	private LocalDate createdDate;
	
}
