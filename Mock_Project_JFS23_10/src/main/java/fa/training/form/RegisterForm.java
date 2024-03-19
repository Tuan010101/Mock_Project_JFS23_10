package fa.training.form;

import javax.persistence.Column;
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
public class RegisterForm {
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{6,50}$", message = "The account must be alphanumeric and have at least 6 and maximum 50 alphanumeric characters")
	@Column(unique = true)
	private String username;
	
	@NotBlank(message = "Can not be empty")
	@Length(max = 50, message = "Maximum account length is 50 characters")
	private String password;
	
	@Pattern(regexp = "^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$", message = "Invalid email")
	@Length(max = 320, message = "Maximum account length is 320 characters")
	@Column(unique = true, length = 320)
	private String email;
}