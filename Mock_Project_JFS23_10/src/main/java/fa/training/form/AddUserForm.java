package fa.training.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import fa.training.entities.AppUser;
import fa.training.entities.UserRole;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddUserForm {

	@NotBlank(message = "Must not be blank")
	private String userName;

	@NotBlank(message = "Must not be blank")
	private String password;

	@NotBlank(message = "Must not be blank")
	private String email;

	@NotBlank(message = "Must not be blank")
	private String fullName;

	@NotBlank(message = "Must not be blank")
	private String address;

	@NotBlank(message = "Must not be blank")
	private String phoneNumber;

	@NotBlank(message = "Must not be blank")
	private String verifyCode;

	@NotNull(message = "Must not be null")
	private Integer roleId; // Sửa kiểu dữ liệu thành Integer

	public AddUserForm(AppUser appUser) {
		this.userName = appUser.getUsername();
		this.password = appUser.getPassword();
		this.email = appUser.getEmail();
		this.fullName = appUser.getFullName();
		this.address = appUser.getAddress();
		this.phoneNumber = appUser.getPhoneNumber();
		this.verifyCode = appUser.getVerifyCode();
	}

	public AddUserForm(UserRole userRole) {
		this.roleId = userRole.getUserRoleId();

	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
