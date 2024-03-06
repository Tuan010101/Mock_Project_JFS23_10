package fa.training.entities;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int productId;
	
	@Column(name = "product_name")
	private String productName;
	
	private String image;
	
	private String description;
	
	private float price;
	
	private int quantity;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category categoryId;
	
	private int discount;
	
	@Column(name = "start_discount_date")
	private LocalDate startDiscountDate;
	
	@Column(name = "end_discount_date")
	private LocalDate endDiscountDate;
	
	@OneToMany(mappedBy = "productId", cascade = CascadeType.ALL)
	private Set<UserProduct> userProducts;
}
