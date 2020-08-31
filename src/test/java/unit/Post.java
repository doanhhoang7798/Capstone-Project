package unit;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertFalse;
import static org.testng.Assert.assertNotEquals;
import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import java.util.Set;

import javax.validation.ConstraintViolation;
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

import connecter.data;


@Test
@ContextConfiguration(locations = { "../connecter/spring-servlet.xml" })

public class Post extends AbstractTestNGSpringContextTests{

	@Autowired(required = true)
	PostDao postDao;
	Posts post;
	
	@Autowired(required = true)
	UserDao userDao;
	
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
	
	//@Test(description = "Leave column price blank and other column input correctly.", groups = "post validate", priority = 15)
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
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				0, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);		
	}
	
	@Test(description = "Leave column ration blank and other column input correctly.", groups = "post validate", priority = 21)
	public void post_validate_21() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, 0, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column kind blank and other column input correctly.", groups = "post validate", priority = 22)
	public void post_validate_22() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, null, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column main material blank and other column input correctly.", groups = "post validate", priority = 23)
	public void post_validate_23() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, null, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column nation blank and other column input correctly.", groups = "post validate", priority = 24)
	public void post_validate_24() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, null, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column holiday blank and other column input correctly.", groups = "post validate", priority = 25)
	public void post_validate_25() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, null, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column category blank and other column input correctly.", groups = "post validate", priority = 26)
	public void post_validate_26() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, null,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	@Test(description = "Leave column suitable blank and other column input correctly.", groups = "post validate", priority = 27)
	public void post_validate_27() {
			
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				null, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertEquals(0, result);
	}
	
	///////////////////////////
	@Test(description = "input column title 3 characters and other column input correctly.", groups = "post validate", priority = 28)
	public void post_validate_28() {
		post.setVideo_url(data.video_url);
		post.setTitle(null);
		post.setOverview(data.overview);
		post.setMaking(data.making);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 50", constraintViolations.iterator().next().getMessage());
	}
	
	
	@Test(description = "input column title 51 characters and other column input correctly.", groups = "post validate", priority = 29)
	public void post_validate_29() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.characters_51);
		post.setOverview(data.overview);
		post.setMaking(data.making);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 50", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column overview 3 characters and other column input correctly.", groups = "post validate", priority = 30)
	public void post_validate_30() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.title);
		post.setOverview(data.characters_3);
		post.setMaking(data.making);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 500", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column overview 501 characters and other column input correctly.", groups = "post validate", priority = 31)
	public void post_validate_31() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.title);
		post.setOverview(data.characters_3);
		post.setMaking(data.making);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 500", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column material detail 3 characters and other column input correctly.", groups = "post validate", priority = 32)
	public void post_validate_32() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.title);
		post.setOverview(data.overview);
		post.setMaking(data.making);
		post.setMaterial_detail(data.characters_3);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 1000", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column material detail 1002 characters and other column input correctly.", groups = "post validate", priority = 33)
	public void post_validate_33() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.title);
		post.setOverview(data.overview);
		post.setMaking(data.making);
		post.setMaterial_detail(data.characters_1002);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 1000", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column making 3 characters and other column input correctly.", groups = "post validate", priority = 34)
	public void post_validate_34() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.title);
		post.setOverview(data.overview);
		post.setMaking(data.characters_3);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 10000", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column making 10020 characters and other column input correctly.", groups = "post validate", priority = 35)
	public void post_validate_35() {
		post.setVideo_url(data.video_url);
		post.setTitle(data.title);
		post.setOverview(data.overview);
		post.setMaking(data.characters_3);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("size must be between 5 and 10000", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column video url not format youtube and other column input correctly.", groups = "post validate", priority = 36)
	public void post_validate_36() {
		post.setVideo_url(data.video_url_err);
		post.setTitle(data.title);
		post.setOverview(data.overview);
		post.setMaking(data.making);
		post.setMaterial_detail(data.material_detail);
		post.setTime(data.time);
		post.setRation(data.ration);
		post.setKind(data.kind);
		post.setMain_material(data.main_material);
		post.setPrice(data.price);
		post.setNation(data.nation);
		post.setHoliday(data.holiday);
		post.setCategory(data.category);
		post.setSuitable(data.suitable);
		post.setView_conter(data.view_conter);
		post.setCreated_at(data.timestamp);
		post.setSuitable(data.suitable);
		post.setUser(userDao.all().get(0));
		
		Set<ConstraintViolation<model.Posts>> constraintViolations = validator.validate(post);
		assertEquals("video url must have format https://www.youtube.com/", constraintViolations.iterator().next().getMessage());
	}
	
	@Test(description = "input column title 5 characters and other column input correctly.", groups = "post validate", priority = 37)
	public void post_validate_37() {
		int result = postDao.Create(new Posts(data.video_url, data.characters_5, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	@Test(description = "input column title 50 characters and other column input correctly.", groups = "post validate", priority = 38)
	public void post_validate_38() {
		int result = postDao.Create(new Posts(data.video_url, data.characters_50, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	@Test(description = "input column overview 5 characters and other column input correctly.", groups = "post validate", priority = 39)
	public void post_validate_39() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.characters_5, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	@Test(description = "input column overview 200 characters and other column input correctly.", groups = "post validate", priority = 40)
	public void post_validate_40() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.characters_5, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}	
	
	@Test(description = "input column material detail 5 characters and other column input correctly.", groups = "post validate", priority = 41)
	public void post_validate_41() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.characters_5, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	@Test(description = "input column material detail 501 characters and other column input correctly.", groups = "post validate", priority = 42)
	public void post_validate_42() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.characters_501, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	@Test(description = "input column making 5 characters and other column input correctly.", groups = "post validate", priority = 43)
	public void post_validate_43() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.characters_5, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	@Test(description = "input column making 1002 characters and other column input correctly.", groups = "post validate", priority = 43)
	public void post_validate_44() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.characters_1002, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, null));
		assertEquals(0, result);
	}
	
	////////////////
	@Test(description = "Create post", groups = "create post", priority = 45)
	public void post_create_45() {
		int result = postDao.Create(new Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));

		assertNotEquals(0, result);
	}
	
	/////////////////////
	@Test(description = "UnBlock record delete_at = !null.", groups = "delete post", priority = 46)
	public void post_delete_46() {
		postDao.Create(new model.Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, data.delete_at, userDao.all().get(0)));
		boolean result = postDao.setStatus(postDao.all().get(0).getId(), null);
				
		assertTrue(result);
	}
	
	@Test(description = "Block record delete_at = null.", groups = "delete post", priority = 47)
	public void post_delete_47() {
		postDao.Create(new model.Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		boolean result = postDao.setStatus(postDao.all().get(0).getId(), post.getDeleted_at());
				
		assertTrue(result);
	}
	
	@Test(description = "Get list post.", groups = "list post", priority = 48)
	public void post_list_48() {
		postDao.Create(new model.Posts(data.video_url, data.title, data.overview, data.making, data.material_detail, 
				data.time, data.ration, data.kind, data.main_material, data.price, data.nation, data.holiday, data.category,
				data.suitable, data.view_conter,data.timestamp, null, userDao.all().get(0)));
		assertNotNull(postDao.all());

	}
	
	@Test(description = "Find by ID.", groups = "list post", priority = 49)
	public void post_findBy_id_49() {
		assertNotNull(postDao.setStatus(postDao.all().get(0).getId(), null));

	}
	
	@Test(description = "View count all.", groups = "list post", priority = 50)
	public void post_viewCountAll_50() {
		assertNotNull(postDao.viewCountAll());

	}
	
	@Test(description = "Get posts same kind.", groups = "list post", priority = 51)
	public void post_refer_51() {
		assertNotNull(postDao.refer(data.kind));

	}
	
	@Test(description = "View count.", groups = "list post", priority = 50)
	public void post_viewCount_52() {
		assertNotNull(postDao.viewCount(postDao.all().get(0).getId()));

	}
	
	
	
	


	
	
	
}
