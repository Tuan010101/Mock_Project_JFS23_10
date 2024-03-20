package fa.training.form;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import fa.training.entities.Bill;
import fa.training.entities.UserProduct;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddBillForm {

	@NotBlank(message = "Không được để trống")
	private String fullName;

	@NotBlank(message = "Không được để trống")
	private String address;

	@Column(name = "phone_number")
	@NotBlank(message = "Không được để trống")
	private String phoneNumber;

	@NotBlank(message = "Không được để trống")
	@Email(message = "Phải là địa chỉ email hợp lệ")
	private String email;

	private int status;

	@NotNull(message = "Phải chọn một")
	private int paymentMethod;

	@NotNull(message = "Ngày mua không được để trống")
	private LocalDate buyDate;

	@NotNull(message = "Thời gian mua không được để trống")
	private LocalTime buyTime;

	private Integer userProductId;

	public AddBillForm(Bill bill) {
		this.fullName = bill.getFullName();
		this.address = bill.getAddress();
		this.phoneNumber = bill.getPhoneNumber();
		this.email = bill.getEmail();
		this.status = bill.getStatus();
		this.paymentMethod = bill.getPaymentMethod();
		this.buyDate = bill.getBuyDate();
		this.buyTime = bill.getBuyTime();
	}

	public AddBillForm(UserProduct userProduct) {
		this.userProductId = userProduct.getUserProductId();
	}

	public void setUserProductId(Integer userProductId) {
		this.userProductId = userProductId;
	}
}
