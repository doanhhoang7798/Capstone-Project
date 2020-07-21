package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comments {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column

	private String content;

	@Column

	private String image_url;

	@Column
	private String deleted_at;

	@Column
	private String created_at;

	public String getDeleted_at() {
		return deleted_at;
	}

	public void setDeleted_at(String deleted_at) {
		this.deleted_at = deleted_at;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	@ManyToOne
	@JoinColumn(name = "user_id")
	private Users user;

	@ManyToOne
	@JoinColumn(name = "post_id")
	private Posts post;

	public Comments() {
		super();
	}

	public Comments(Integer id, Posts post, Users user, String content, String image_url, String deleted_at,
			String created_at) {
		super();
		this.id = id;
		this.content = content;
		this.image_url = image_url;
		this.deleted_at = deleted_at;
		this.created_at = created_at;
		this.user = user;
		this.post = post;
	}

	public Comments(Posts post, Users user, String content, String image_url, String deleted_at, String created_at) {
		super();
		this.post = post;
		this.content = content;
		this.deleted_at = deleted_at;
		this.created_at = created_at;
		this.user = user;
		this.image_url = image_url;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Posts getPost() {
		return post;
	}

	public void setPost(Posts post) {
		this.post = post;
	}

}
