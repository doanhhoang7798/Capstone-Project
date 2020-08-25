package model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "posts")
public class Posts {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String video_url;
	
	@NotNull
	@Size(min = 5, max = 50)
	@Column
	private String title;
	
	@NotNull
	@Size(min = 5, max = 500)
	@Column
	private String overview;
	
	@NotNull
	@Size(min = 5, max = 10000)
	@Column
	private String making;
	
	@NotNull
	@Size(min = 5, max = 1000)
	@Column
	private String material_detail;
	
	@Column
	private int time;
	
	@Column
	private int ration;
	
	@Column
	private String kind;
	
	@Column				   
	private String main_material;
	
	@NotNull
	@Size(min = 0, max = 10000)
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

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}

	@ManyToOne
	@JoinColumn(name = "user_id")
	private Users user;

	public List<Reactions> getReactions() {
		return reactions;
	}

	public void setReactions(List<Reactions> reactions) {
		this.reactions = reactions;
	}

	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
	@OrderBy("created_at ASC")

	public List<Comments> comments;
	
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Reactions> reactions;

	public Posts() {
		super();
	}


	public Posts( String video_url, String title, String overview, String making, String material_detail,
			int time, int ration, String kind, String main_material, int price, String nation, String holiday,
			String category, String suitable, int view_conter, Timestamp created_at, String deleted_at, Users user
			) {
		super();
		this.video_url = video_url;
		this.title = title;
		this.overview = overview;
		this.making = making;
		this.material_detail = material_detail;
		this.time = time;
		this.ration = ration;
		this.kind = kind;
		this.main_material = main_material;
		this.price = price;
		this.nation = nation;
		this.holiday = holiday;
		this.category = category;
		this.suitable = suitable;
		this.view_conter = view_conter;
		this.created_at = created_at;
		this.deleted_at = deleted_at;
		this.user = user;
	
	}

	public Posts(Integer id, Users user_id, String video_url, String title, String overview, String making,
			String material_detail, int time, int ration, String kind, String main_material, int price, String nation, String holiday,
			String category, String suitable, Timestamp created_at, String deleted_at) {
		super();
		this.id = id;
		this.user = user_id;
		this.video_url = video_url;
		this.title = title;
		this.overview = overview;
		this.making = making;
		this.material_detail = material_detail;
		this.time = time;
		this.ration = ration;
		this.kind = kind;
		this.main_material = main_material;
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

	public String getMaterial_detail() {
		return material_detail;
	}

	public void setMaterial_detail(String material_detail) {
		this.material_detail = material_detail;
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



	public String getMain_material() {
		return main_material;
	}

	public void setMain_material(String main_material) {
		this.main_material = main_material;
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
