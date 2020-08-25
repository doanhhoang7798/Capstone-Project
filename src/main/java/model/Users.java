package model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;


@Entity
@Table(name = "users")
public class Users implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	

	@Column
	private String email;

	@NotNull
	@Size(min = 3, max = 40)
	@Column
	private String fullname;
	
	@NotNull
	@Size(min = 8, max = 20)
	@Column

	private String password;

	@NotNull
	@Length(min = 10, max = 10)
	@Column
	private String phone;
	
	@Column
	private Integer gender;

	@Column

	private Integer role;
	@Column

	private String birthday;
	@Column

	private String country;

	@Column

	private String bio;
	@Column

	private String image;

	@Column
	private Timestamp created_at;

	@Column

	private Integer status;

	@Column

	private String block_date;
	
	
	@Column

	private String confirm_code;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Posts> posts;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Comments> comments;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Reports> reports;
	
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Reactions> reactions;
	
	

	public List<Reactions> getReactions() {
		return reactions;
	}

	public void setReactions(List<Reactions> reactions) {
		this.reactions = reactions;
	}

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}

	public List<Reports> getReports() {
		return reports;
	}

	public void setReports(List<Reports> reports) {
		this.reports = reports;
	}

	public List<Posts> getPosts() {
		return posts;
	}

	public void setPosts(List<Posts> posts) {
		this.posts = posts;
	}

	public Users() {
		super();
	}

	public Users(String email, String fullname, String password, String phone, String country, Timestamp created_at,
			Integer status, Integer gender, Integer role, String image) {
		super();
		this.image = image;
		this.email = email;
		this.fullname = fullname;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.role = role;
		this.country = country;
		this.created_at = created_at;
		this.status = status;
	}
	
	public Users(String fullname, String password, String phone, Timestamp created_at,
			Integer status, Integer gender, Integer role, String image) {
		super();
		this.image = image;
		this.fullname = fullname;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.role = role;
		this.created_at = created_at;
		this.status = status;
	}


	public Users(Integer id, String email, String fullname, String password, String phone, Integer gender,
			Integer role, String birthday, String country, String bio, String image,
			Timestamp created_at, Integer status, String block_date) {
		super();
		this.id = id;
		this.email = email;
		this.fullname = fullname;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.role = role;
		this.birthday = birthday;
		this.country = country;
		this.bio = bio;
		this.image = image;
		this.created_at = created_at;
		this.status = status;
		this.block_date = block_date;
	}

	
	
	public String getConfirm_code() {
		return confirm_code;
	}

	public void setConfirm_code(String confirm_code) {
		this.confirm_code = confirm_code;
	}

	public Users(Integer id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getBlock_date() {
		return block_date;
	}

	public void setBlock_date(String block_date) {
		this.block_date = block_date;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
