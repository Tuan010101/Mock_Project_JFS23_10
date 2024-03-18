package fa.training.form;

import javax.validation.constraints.NotBlank;

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
public class AddProductDiscountForm {

	@NotBlank(message = "Không được để trống")
	private Product product;

	@NotBlank(message = "Không được để trống")
	private Discount discount;

	public AddProductDiscountForm(ProductDiscount productDiscount) {
		this.product = productDiscount.getProduct();
		this.discount = productDiscount.getDiscount();
	}
}
