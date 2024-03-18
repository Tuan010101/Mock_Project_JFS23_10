package fa.training.form;


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
public class ForgotPasswordForm {
	@NotBlank(message = "Can not be empty")
	@Pattern(regexp = "^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$", message = "Invalid email")
	@Length(max = 320, message = "Maximum account length is 320 characters")
	private String email;
	
	private String verifyCode;
}
