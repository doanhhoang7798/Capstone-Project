package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "TipNutri")
public class TipNutri {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotNull
	@Size(min = 20, max = 100)
	@Column
	private String title;

	@NotNull
	@Size(min = 200)
	@Column
	private String content;

	@NotNull

	@Column
	private String type;

	@NotNull
	@Column
	@Size(min = 20, max = 255)
	private String author;

	@NotNull
	@Column
	private String kind;

	@Column
	private String created_at;

	@NotNull
	@Column
	private String image;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Users user;

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public TipNutri(String title, String content, String type, String author, String created_at, String kind,
			String image, Users user) {
		super();

		this.user = user;
		this.kind = kind;
		this.title = title;
		this.content = content;
		this.type = type;
		this.author = author;
		this.created_at = created_at;
		this.image = image;
	}

	public TipNutri(Integer id, String title, String content, String type, String author, String created_at, String kind,
			String image, Users user) {
		super();
		this.user = user;
		this.id = id;
		this.kind = kind;
		this.title = title;
		this.content = content;
		this.type = type;
		this.author = author;
		this.created_at = created_at;
		this.image = image;
	}

	public TipNutri() {
		super();
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

}
