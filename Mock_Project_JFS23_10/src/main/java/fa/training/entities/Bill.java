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
	private String fullName;
	
	private String address;
	
	private int status;
	
	@Column(name = "buy_date")
	private LocalDate buyDate;
	
	@Column(name = "buy_time")
	private LocalTime buyTime;
	
	@OneToMany(mappedBy = "billId", cascade = CascadeType.ALL)
	private Set<UserProduct> userProducts;
}
