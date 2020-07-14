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

@Entity
@Table(name = "users")
public class Users implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String email;

	@Column

	private String fullname;
	@Column

	private String password;
	@Column

	private String phone;
	@Column

	private Integer age;

	@Column

	private Integer gender;

	@Column

	private Integer role;
	@Column

	private String birthday;
	@Column

	private String country;
	@Column

	private String provider;

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

	 @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	    private List<Posts> posts;
	 
	 

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
			Integer status, Integer gender, Integer role) {
		super();
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

	public Users(Integer id, String email, String fullname, String password, String phone, Integer age, Integer gender,
			Integer role, String birthday, String country, String provider, String bio, String image,
			Timestamp created_at, Integer status, String block_date) {
		super();
		this.id = id;
		this.email = email;
		this.fullname = fullname;
		this.password = password;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.role = role;
		this.birthday = birthday;
		this.country = country;
		this.provider = provider;
		this.bio = bio;
		this.image = image;
		this.created_at = created_at;
		this.status = status;
		this.block_date = block_date;
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

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
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

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
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
