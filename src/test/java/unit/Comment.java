package unit;

import static org.testng.Assert.*;

import java.util.Date;

import javax.validation.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import connecter.data;
import dao.CommentDao;
import dao.PostDao;
import dao.UserDao;
import model.Comments;
@Test
@ContextConfiguration(locations = { "../connecter/spring-servlet.xml" })
public class Comment extends AbstractTestNGSpringContextTests{
	@Autowired(required = true)
	CommentDao commentDao;
	Comments comment;
	
	@Autowired(required = true)
	PostDao postDao;
	
	@Autowired(required = true)
	UserDao userDao;
	
	private static Validator validator;
	private static Date timestamp = new Date();
	
	@BeforeMethod
	void beforeMethod() {
		comment = new Comments();
	}
	
	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	
	@Test(description = "Only input column image.", groups = "comment validate", priority = 1)
	public void comment_validate_1() {
		comment.setImage_url(data.image);
		Comments result = commentDao.Create(comment);
		assertNull(result);
		
	}
	
	@Test(description = "Only input column post_id.", groups = "comment validate", priority = 2)
	public void comment_validate_2() {
		comment.setPost(postDao.all().get(0));
		Comments result = commentDao.Create(comment);
		assertNull(result);
		
	}
	
	@Test(description = "Only input column user_id.", groups = "comment validate", priority = 3)
	public void comment_validate_3() {
		comment.setUser(userDao.all().get(0));
		Comments result = commentDao.Create(comment);
		assertNull(result);
		
	}
	
	@Test(description = "Only input column content.", groups = "comment validate", priority = 4)
	public void comment_validate_4() {
		comment.setContent(data.content);
		Comments result = commentDao.Create(comment);
		assertNull(result);
		
	}
	
	@Test(description = "Leave column image blank and other column input correctly.", groups = "comment validate", priority = 5)
	public void comment_validate_5() {
		Comments result = commentDao.Create(new Comments(postDao.all().get(0), userDao.all().get(0), data.content, null,
				timestamp.toString()));
		assertNotNull(result);

	}
	
	@Test(description = "Leave column post_id blank and other column input correctly.", groups = "comment validate", priority = 6)
	public void comment_validate_6() {
		Comments result = commentDao.Create(new Comments(null, userDao.all().get(0), data.content, data.image,
				timestamp.toString()));
		assertNull(result);

	}
	
	@Test(description = "Leave column user_id blank and other column input correctly.", groups = "comment validate", priority = 7)
	public void comment_validate_7() {
		Comments result = commentDao.Create(new Comments(postDao.all().get(0), null, data.content, data.image,
				 timestamp.toString()));
		assertNull(result);

	}
	
	@Test(description = "Leave column content blank and other column input correctly.", groups = "comment validate", priority = 8)
	public void comment_validate_8() {
		Comments result = commentDao.Create(new Comments(postDao.all().get(0), userDao.all().get(0), null, data.image,
				timestamp.toString()));
		assertNull(result);

	}
	
	@Test(description = "create a commnet", groups = "comment validate", priority = 9)
	public void comment_create_9() {
		Comments result = commentDao.Create(new Comments(postDao.all().get(0), userDao.all().get(0), data.content, data.image,
				timestamp.toString()));
		assertNotNull(result);
		
	}
	
	@Test(description = "Delete record exists.", groups = "delete comment", priority = 10)
	public void comment_delete_10() {
		commentDao.Create(new Comments(postDao.all().get(0), userDao.all().get(0), data.content, data.image,
				timestamp.toString()));
		boolean result = commentDao.Delete(commentDao.list().get(0).getId());
		assertTrue(result);
		
	}

	@Test(description = "Delete record not exists.", groups = "delete comment", priority = 11)
	public void comment_delete_11() {
		commentDao.Create(new Comments(postDao.all().get(0), userDao.all().get(0), data.content, data.image,
				timestamp.toString()));
		int Id = (commentDao.list().get(commentDao.list().size()-1).getId())+1;
		boolean result = commentDao.Delete(Id);
		assertFalse(result);

	}
	
	@Test(description = "Get list comment.", groups = "list comment", priority = 12)
	public void comment_list_12() {
		commentDao.Create(new Comments(postDao.all().get(0), userDao.all().get(0), data.content, data.image,
				timestamp.toString()));
		assertNotNull(commentDao.list());

	}
	
	@Test(description = "Find by ID.", groups = "list comment", priority = 13)
	public void comment_findBy_id_13() {
		assertNotNull(commentDao.Delete(commentDao.list().get(0).getId()));
		
	}
	
	@Test(description = "Update common exists.", groups = "Update Comment", priority = 14)
	public void comment_update_exists_14() {
		Comments comment = commentDao.list().get(0);
		comment.setContent("aaaaaaaaaa");
		Comments result = commentDao.Update(comment);
		assertNotNull(result);

	}
	
	@Test(description = "Update common non exists.", groups = "Update Comment", priority = 15)
	public void comment_update_exists_15() {
		Comments comment = commentDao.findByID(0);
		Comments result = commentDao.Update(comment);
		assertNull(result);

	}
	
	@Test(description = "all column empty.", groups = "comment validate", priority = 1)
	public void comment_validate_16() {
		Comments result = commentDao.Create(comment);
		assertNull(result);
		
	}
}
