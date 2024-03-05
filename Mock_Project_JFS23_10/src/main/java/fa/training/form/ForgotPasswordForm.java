package fa.training.form;


import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ForgotPasswordForm {
	@NotNull(message = "Can not be empty")
	private String email;
	
	private String verifyCode;
}
