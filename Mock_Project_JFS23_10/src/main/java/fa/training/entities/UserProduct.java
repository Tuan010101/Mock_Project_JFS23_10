package fa.training.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class UserProduct implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_product_id")
	int userProductId;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User userId;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product productId;
	
	private int quantity;
	
	@ManyToOne
	@JoinColumn(name = "bill_id")
	private int billId;
}
