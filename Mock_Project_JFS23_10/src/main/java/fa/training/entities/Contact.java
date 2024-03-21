package fa.training.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

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
	@Pattern(regexp = "^[a-z A-Z]*$", message = "Only aphabet characters and spaces are allowed")
	@Length(min = 1, max = 50, message = "Must be between 1 and 50 characters")
	private String fullName;

	@NotBlank(message = "Must not be blank")
	@Email(message = "Must be a well-formed email address")
	private String email;

	@NotBlank(message = "Must not be blank")
	@Pattern(regexp = "^[a-z A-Z0-9]*$", message = "Only aphanumberic characters and spaces are allowed")
	@Length(min = 1, max = 50, message = "Must be between 1 and 50 characters")
	private String subject;

	@NotBlank(message = "Must not be blank")
	@Length(min = 1, max = 200, message = "Must be between 1 and 200 characters")
	private String message;

	private boolean replied;

	@Column(name = "created_date")
	private LocalDate createdDate;

}
