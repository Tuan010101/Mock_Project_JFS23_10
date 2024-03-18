package fa.training.form;


import javax.validation.constraints.NotBlank;

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
	@Length(max = 320, message = "Maximum account length is 320 characters")
	private String email;
	
	private String verifyCode;
}
