package junit;

import static org.testng.Assert.assertEquals;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import dao.PostDao;
import dao.UserDao;
import model.Posts;

import connecter.data;

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
}
