package fa.training.entities;

import java.io.Serializable;

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
public class UserRole implements Serializable{
	/**
	 * @author 	Nguyen Ngoc Tuan
	 * @birthDay	01/01/2001
	 * @file 	UserRole.java
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userRoleId;
	
	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role roleId;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private AppUser userId;
}
