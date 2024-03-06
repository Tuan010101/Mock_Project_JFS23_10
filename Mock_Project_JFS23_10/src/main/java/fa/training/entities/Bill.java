
package fa.training.entities;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bill_id")
	private int billId;

	@Column(name = "full_name")
	@NotBlank(message = "Must not be blank")
	private String fullName;

	@NotBlank(message = "Must not be blank")
	private String address;

	@Column(name = "phone_number")
	@NotBlank(message = "Must not be blank")
	private String phoneNumber;

	@NotBlank(message = "Must not be blank")
	@Email(message = "Must be a well-formed email address")
	private String email;

	private int status;

	@Column(name = "payment_method")
	@NotNull(message = "Must pick one")
	private int paymentMethod;

	@Column(name = "buy_date")
	private LocalDate buyDate;

	@Column(name = "buy_time")
	private LocalTime buyTime;

	@OneToMany(mappedBy = "billId", cascade = CascadeType.ALL)
	private Set<UserProduct> userProducts;
}
