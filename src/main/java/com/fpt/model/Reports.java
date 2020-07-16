package com.fpt.model;

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

	private String reportable_type;
	@Column

	private int reportable_id;
	@Column

	private int type;

	@Column
	private String created_at;

	@Column
	private int reportable_author;

	@ManyToOne
	@JoinColumn(name = "user_id")
	public Users user;

	public Reports() {
		super();
	}

	public Reports(String reportable_type, int reportable_id, int type, Users user, String created_at,
			int reportable_author) {
		super();
		this.reportable_author = reportable_author;
		this.created_at = created_at;
		this.reportable_type = reportable_type;
		this.reportable_id = reportable_id;
		this.type = type;
		this.user = user;
	}
	
	

	public int getReportable_author() {
		return reportable_author;
	}

	public void setReportable_author(int reportable_author) {
		this.reportable_author = reportable_author;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReportable_type() {
		return reportable_type;
	}

	public void setReportable_type(String reportable_type) {
		this.reportable_type = reportable_type;
	}

	public int getReportable_id() {
		return reportable_id;
	}

	public void setReportable_id(int reportable_id) {
		this.reportable_id = reportable_id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
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
