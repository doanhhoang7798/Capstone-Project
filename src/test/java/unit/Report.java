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
import dao.ReportDao;
import dao.UserDao;
import model.Comments;
import model.Reports;
@Test
@ContextConfiguration(locations = { "../connecter/spring-servlet.xml" })
public class Report extends AbstractTestNGSpringContextTests{
	@Autowired(required = true)
	ReportDao reportDao;
	Reports reports;
	
	@Autowired(required = true)
	PostDao postDao;
	
	@Autowired(required = true)
	UserDao userDao;
	
	@Autowired(required = true)
	CommentDao commentDao;
	
	private static Validator validator;
	private static Date timestamp = new Date();
	
	@BeforeMethod
	void beforeMethod() {
		reports = new Reports();
	}
	
	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	
	@Test(description = "Only input column comment id.", groups = "report validate", priority = 1)
	public void comment_validate_1() {
		reports.setcmt_id(1);
		boolean result = reportDao.Create(reports);
		assertFalse(result);		
	}
	
	@Test(description = "Only input column user id.", groups = "report validate", priority = 2)
	public void comment_validate_2() {
		reports.setUser(userDao.all().get(0));
		boolean result = reportDao.Create(reports);
		assertTrue(result);		
	}
	
	@Test(description = "Only input column type.", groups = "report validate", priority = 3)
	public void comment_validate_3() {
		reports.setType("1");
		boolean result = reportDao.Create(reports);
		assertFalse(result);		
	}
	
	@Test(description = "Only input column report author id.", groups = "report validate", priority = 4)
	public void comment_validate_4() {
		reports.setreport_author(2);
		boolean result = reportDao.Create(reports);
		assertFalse(result);		
	}
	
	@Test(description = "Leave column comment id and other column input correctly", groups = "report validate", priority = 5)
	public void comment_validate_5() {
		boolean result = reportDao.Create(new Reports(0, "1", userDao.all().get(0), timestamp.toString(), 2));
		assertTrue(result);		
	}
	
	@Test(description = "Leave column user id blank and other column input correctly .", groups = "report validate", priority = 6)
	public void comment_validate_6() {
		boolean result = reportDao.Create(new Reports(1,"1", null, timestamp.toString(), 2));
		assertFalse(result);
	}
	
	@Test(description = "Leave column type blank and other column input correctly.", groups = "report validate", priority = 7)
	public void comment_validate_7() {
		boolean result = reportDao.Create(new Reports(1, "1", userDao.all().get(0), timestamp.toString(), 2));
		assertTrue(result);			
	}
	
	@Test(description = "Leave column report author id blank and other column input correctly .", groups = "report validate", priority = 8)
	public void comment_validate_8() {
		boolean result = reportDao.Create(new Reports(1, "1", userDao.all().get(0), timestamp.toString(), 0));
		assertTrue(result);			
	}
	
	
}
