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
public class ProfileForm {
	@NotBlank(message = "Can not be empty")
	@Length(max = 100, message = "Maximum account length is 100 characters")
	private String fullName;
	
	@NotBlank(message = "Can not be empty")
	@Length(max = 200, message = "Maximum account length is 200 characters")
	private String address;
	
	@Pattern(regexp = "^(0|84|\\+84)\\d{9}$", message = "Invalid phone number")
	private String phoneNumber;
	
	private String image;
}
