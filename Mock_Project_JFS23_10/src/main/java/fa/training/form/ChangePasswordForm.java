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
public class ChangePasswordForm {
	@NotBlank(message = "Can not be empty")
	@Length(max = 50, message = "Maximum account length is 50 characters")
	private String newPassword;
	
	private String currentPassword;
}
