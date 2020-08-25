package junit;

import static org.testng.Assert.assertEquals;

import java.sql.Timestamp;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import dao.PostDao;
import dao.UserDao;
import model.Posts;
import model.Users;
import connecter.data;

@Test
@ContextConfiguration(locations = { "../connecter/spring-servlet.xml" })

public class Post extends AbstractTestNGSpringContextTests {

	@Autowired(required = true)
	PostDao postDao;
	Posts post;

	@Autowired(required = true)
	UserDao userDao;
	Users user;

	private static Validator validator;

	@BeforeMethod
	void beforeMethod() {
		post = new Posts();
	}

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	@Test(description = "All column empty.", groups = "post validate", priority = 1)
	public void post_validate_1() {
		int result = postDao.Create(post);

		assertEquals(0, result);
	}

	@Test(description = "Only input column title.", groups = "post validate", priority = 2)
	public void post_validate_2() {
		post.setTitle(data.title);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column link video.", groups = "post validate", priority = 3)
	public void post_validate_3() {
		post.setVideo_url(data.video_url);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column price.", groups = "post validate", priority = 4)
	public void post_validate_4() {
		post.setPrice(data.price);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column overview.", groups = "post validate", priority = 5)
	public void post_validate_5() {
		post.setOverview(data.overview);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column material_detail.", groups = "post validate", priority = 6)
	public void post_validate_6() {
		post.setMaterial_detail(data.material_detail);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column making.", groups = "post validate", priority = 7)
	public void post_validate_7() {
		post.setMaking(data.making);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column time.", groups = "post validate", priority = 8)
	public void post_validate_8() {
		post.setTime(data.time);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column ration.", groups = "post validate", priority = 9)
	public void post_validate_9() {
		post.setRation(data.ration);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column nation.", groups = "post validate", priority = 10)
	public void post_validate_10() {
		post.setNation(data.nation);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column holiday.", groups = "post validate", priority = 11)
	public void post_validate_11() {
		post.setHoliday(data.holiday);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column category.", groups = "post validate", priority = 12)
	public void post_validate_12() {
		post.setCategory(data.category);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Only input column suitable.", groups = "post validate", priority = 13)
	public void post_validate_13() {
		post.setCategory(data.category);
		int result = postDao.Create(post);
		assertEquals(0, result);

	}

	@Test(description = "Leave column title blank and other column input correctly.", groups = "post validate", priority = 14)
	public void post_validate_14() {
			
		int result = postDao.Create(new Posts(data.video_url, null, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
//	@Test(description = "Leave column price blank and other column input correctly.", groups = "post validate", priority = 15)
//	public void common_validate_15() {
//			
//		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
//				data.time, data.ration, data.kind, data.main_material, 0, data.nation, data.holiday, data.category,
//				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
//		assertEquals(0, result);
//	}

	@Test(description = "Leave column url video blank and other column input correctly.", groups = "post validate", priority = 16)
	public void post_validate_16() {
			
		int result = postDao.Create(new Posts(null, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column overview blank and other column input correctly.", groups = "post validate", priority = 17)
	public void post_validate_17() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, null, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column material detail blank and other column input correctly.", groups = "post validate", priority = 18)
	public void post_validate_18() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, null, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}

	@Test(description = "Leave column making blank and other column input correctly.", groups = "post validate", priority = 19)
	public void post_validate_19() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column time blank and other column input correctly.", groups = "post validate", priority = 20)
	public void post_validate_20() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				0, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column ration blank and other column input correctly.", groups = "post validate", priority = 21)
	public void post_validate_21() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, 0, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column kind blank and other column input correctly.", groups = "post validate", priority = 22)
	public void post_validate_22() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, null, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column main material blank and other column input correctly.", groups = "post validate", priority = 23)
	public void post_validate_23() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, data.kind, null, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column nation blank and other column input correctly.", groups = "post validate", priority = 24)
	public void post_validate_24() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, null, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column holiday blank and other column input correctly.", groups = "post validate", priority = 25)
	public void post_validate_25() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, null, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column category blank and other column input correctly.", groups = "post validate", priority = 26)
	public void post_validate_26() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, null,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column suitable blank and other column input correctly.", groups = "post validate", priority = 27)
	public void post_validate_27() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, null, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				null, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	
	
}
