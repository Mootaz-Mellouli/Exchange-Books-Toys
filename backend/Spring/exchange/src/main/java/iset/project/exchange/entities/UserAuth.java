package iset.project.exchange.entities;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Entity
@Data 
@AllArgsConstructor 
@NoArgsConstructor
@Table(name="USER")
public class UserAuth implements Serializable, UserDetails{
	@Id
	private String userId;
	private String username;
	private String password;
	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
            )
    private Set<Role> roles = new HashSet<>();
	
	public String getUserId() {
	return userId;
	}
	public void setUserId(String userId) {
	this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	@Override
	public boolean isAccountNonExpired() {
	return false;
	}
	@Override
	public boolean isAccountNonLocked() {
	return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
	return false;
	}
	@Override
	public boolean isEnabled() {
		return false;
	}
	public void setUsername(String username) {
	this.username = username;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<Role> roles = this.getRoles();           
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
	            for (Role role : roles) {
	                authorities.add(new SimpleGrantedAuthority(role.getName()));
	            }
	            return authorities;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
