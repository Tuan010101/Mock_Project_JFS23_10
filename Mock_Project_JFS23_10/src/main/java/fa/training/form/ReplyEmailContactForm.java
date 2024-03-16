package fa.training.form;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReplyEmailContactForm {

	@NotBlank(message = "Must not be blank")
	@Email(message = "Must be a well-formed email address")
	private String email;
	
	@NotBlank(message = "Must not be blank")
	private String subject;
	
	@NotBlank(message = "Must not be blank")
	private String message;
}
