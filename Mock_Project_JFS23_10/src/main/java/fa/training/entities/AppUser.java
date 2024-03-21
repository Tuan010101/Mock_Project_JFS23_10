package fa.training.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
public class AppUser {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int userId;

	@NotBlank(message = "Can not be empty")
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{6,50}$", message = "The account must be alphanumeric and have at least 6 and maximum 50 alphanumeric characters")
	@Column(unique = true)
	private String username;

	@NotBlank(message = "Can not be empty")
	@Length(max = 50, message = "Maximum account length is 50 characters")
	private String password;

	@Column(name = "encrypted_password")
	private String encryptedPassword;

	@NotBlank(message = "Can not be empty")
	@Pattern(regexp = "^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$", message = "Invalid email")
	@Length(max = 320, message = "Maximum account length is 320 characters")
	@Column(unique = true, length = 320)
	private String email;

	private String image;

	@Column(name = "full_name")
	@Length(max = 50, message = "Maximum account length is 50 characters")
	private String fullName;

	private String address;

	@Column(name = "phone_number")
	private String phoneNumber;

	private int status;

	@Column(name = "verify_code")
	private String verifyCode;

	@OneToMany(mappedBy = "userId", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserProduct> userProducts;

	@OneToMany(mappedBy = "userId", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserRole> userRoles;
}
