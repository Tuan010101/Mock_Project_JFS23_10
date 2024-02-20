package fa.training.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int userId;
	
	private String username;
	
	private String password;
	
	private String email;
	
	@Column(name = "full_name")
	private String fullName;
	
	private String address;
	
	private String phoneNumber;
	
	private int role;
	
	@OneToMany(mappedBy = "userId", cascade = CascadeType.ALL)
	private Set<UserProduct> userProducts;
}
