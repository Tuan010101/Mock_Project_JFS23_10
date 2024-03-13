package fa.training.form;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import fa.training.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddProductForm {

	@NotBlank(message = "Must not be blank")
	private String productName;

	@NotBlank(message = "Must not be blank")
	private String image;

	@NotBlank(message = "Must not be blank")
	private String description;

	@NotNull(message = "Quantity must not be null")
	@DecimalMin(value = "0.00", inclusive = true, message = "Must be greater than or equal to 0.0")
	private float price;

	@NotNull(message = "Quantity must not be null")
	@Min(value = 0, message = "Must be greater than or equal to 0")
	private int quantity;

	@NotNull(message = "Quantity must not be null")
	private int categoryId;

	public AddProductForm(Product product) {
		this.productName = product.getProductName();
		this.image = product.getImage();
		this.description = product.getDescription();
		this.price = product.getPrice();
		this.quantity = product.getQuantity();
		this.categoryId = product.getCategoryId().getCategoryId();
	}

}
