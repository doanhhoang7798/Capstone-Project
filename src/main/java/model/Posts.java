package model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ReactionDao;

@Entity
@Table(name = "posts")
public class Posts {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column

	private String video_url;
	@Column

	private String title;
	@Column

	private String overview;
	@Column

	private String making;
	@Column

	private String material;
	@Column

	private int time;
	@Column

	private int ration;
	@Column

	private String kind;
	@Column

	private String level;
	@Column

	private int price;
	@Column

	private String nation;
	@Column

	private String holiday;
	@Column

	private String category;
	@Column

	private String suitable;
	@Column

	private int view_conter;
	@Column
	private Timestamp created_at;
	
	@Column
	private String deleted_at;
	

	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Users user;

	public Posts() {
		super();
	}

	public Posts(Users user_id, String video_url, String title, String overview, String making, String material, int time,
			int ration, String kind, String level, int price, String nation, String holiday, String category,
			String suitable, Timestamp created_at, String deleted_at) {
		super();
		this.user = user_id;
		this.video_url = video_url;
		this.title = title;
		this.overview = overview;
		this.making = making;
		this.material = material;
		this.time = time;
		this.ration = ration;
		this.kind = kind;
		this.level = level;
		this.price = price;
		this.nation = nation;
		this.holiday = holiday;
		this.category = category;
		this.suitable = suitable;
		this.created_at = created_at;
		this.deleted_at = deleted_at;
	}
	
	
	public Posts(Integer id,Users user_id, String video_url, String title, String overview, String making, String material, int time,
			int ration, String kind, String level, int price, String nation, String holiday, String category,
			String suitable, Timestamp created_at, String deleted_at) {
		super();
		this.id = id;
		this.user = user_id;
		this.video_url = video_url;
		this.title = title;
		this.overview = overview;
		this.making = making;
		this.material = material;
		this.time = time;
		this.ration = ration;
		this.kind = kind;
		this.level = level;
		this.price = price;
		this.nation = nation;
		this.holiday = holiday;
		this.category = category;
		this.suitable = suitable;
		this.created_at = created_at;
		this.deleted_at = deleted_at;
	}

	

	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getMaking() {
		return making;
	}

	public void setMaking(String making) {
		this.making = making;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getRation() {
		return ration;
	}

	public void setRation(int ration) {
		this.ration = ration;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSuitable() {
		return suitable;
	}

	public void setSuitable(String suitable) {
		this.suitable = suitable;
	}

	public int getView_conter() {
		return view_conter;
	}

	public void setView_conter(int view_conter) {
		this.view_conter = view_conter;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public String getDeleted_at() {
		return deleted_at;
	}

	public void setDeleted_at(String deleted_at) {
		this.deleted_at = deleted_at;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	

}
