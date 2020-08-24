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
@Table(name = "reports")
public class Reports {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;


	@Column
	private int cmt_id;
	
	@Column

	private String type;

	@Column
	private String created_at;

	@Column
	private int report_author;

	@ManyToOne
	@JoinColumn(name = "user_id")
	public Users user;

	public Reports() {
		super();
	}

	public Reports(int cmt_id, String type, Users user, String created_at,
			int report_author) {
		super();
		this.report_author = report_author;
		this.created_at = created_at;
		this.cmt_id = cmt_id;
		this.type = type;
		this.user = user;
	}
	
	

	public int getreport_author() {
		return report_author;
	}

	public void setreport_author(int report_author) {
		this.report_author = report_author;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public int getcmt_id() {
		return cmt_id;
	}

	public void setcmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

}
