package fa.training.entities;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Discount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "discount_id")
	private int discountId;

	@NotNull(message = "Quantity must not be null")
	@Min(value = 0, message = "Must be greater than or equal to 0")
	private int discountPercent;

	@NotNull(message = "Start discount date must not be null")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDiscountDate;

	@NotNull(message = "End discount date must not be null")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDiscountDate;
	
	@OneToMany(mappedBy = "discount", cascade = CascadeType.ALL)
	private Set<ProductDiscount> productDiscounts;

}
