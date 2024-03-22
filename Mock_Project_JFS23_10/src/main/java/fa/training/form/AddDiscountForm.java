package fa.training.form;

import java.time.LocalDate;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import fa.training.entities.Discount;
import fa.training.entities.Product;
import fa.training.entities.ProductDiscount;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddDiscountForm {

	@NotNull(message = "Discount percent không được để trống")
	@Min(value = 0, message = "Discount percent không được âm")
	private Integer discountPercent;

	@NotNull(message = "Ngày bắt đầu không được để trống")
	private LocalDate startDiscountDate;

	@NotNull(message = "Ngày kết thúc không được để trống")
	private LocalDate endDiscountDate;

	private int discountId;
	private int productId;

	public AddDiscountForm(Discount discount) {
		this.discountPercent = discount.getDiscountPercent();
		this.startDiscountDate = discount.getStartDiscountDate();
		this.endDiscountDate = discount.getEndDiscountDate();
	}

	public AddDiscountForm(ProductDiscount productDiscount) {
		this.discountId = productDiscount.getDiscount().getDiscountId();
		this.productId = productDiscount.getProduct().getProductId();
	}
}
