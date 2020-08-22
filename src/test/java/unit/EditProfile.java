package unit;

import static org.testng.Assert.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;
import javax.validation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.*;
import org.springframework.test.context.testng.*;
import org.testng.annotations.*;
import dao.*;
import model.*;
import com.twilio.rest.chat.v1.service.User;

import connecter.data;

@Test
@ContextConfiguration(locations = { "../connecter/spring-servlet.xml" })

public class EditProfile extends AbstractTestNGSpringContextTests {
	
	public Timestamp timestamp = new Timestamp(System.currentTimeMillis());

	@Autowired(required = true)
	UserDao userDao;
	Users user;

	private static Validator validator;

	@BeforeMethod
	void beforeMethod() {
		user = new Users();
		
	}
	
	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	


	@Test(description = "All column empty.", groups = "user validate", priority = 1)
	public void user_validate_1() {
		boolean result = userDao.Update(user);
		assertTrue(result);
	}

	@Test(description = "Only input name", groups = "user validate", priority = 2)
	public void user_validate_2() {
		user.setFullname(data.username);
		boolean result =  userDao.Update(user);
		assertTrue(result);
	}
	
	@Test(description = "Only input image", groups = "user validate", priority = 3)
	public void user_validate_3() {
		user.setImage(data.image);
		boolean result = userDao.Update(user);
		assertTrue(result);
	}
	
	@Test(description = "Only input address", groups = "user validate", priority = 4)
	public void user_validate_4() {
		user.setCountry(data.country);
		boolean result = userDao.Update(user);
		assertTrue(result);
	}
	
	@Test(description = "Only input email", groups = "user validate", priority = 5)
	public void user_validate_5() {
		user.setEmail(data.email);
		boolean result = userDao.Update(user);
		assertTrue(result);
	}	
	
	@Test(description = "Only input date of birth", groups = "user validate", priority = 6)
	public void user_validate_6() {
		user.setBirthday(data.birthday);
		boolean result = userDao.Update(user);
		assertTrue(result);
	}
	
	@Test(description = "Only input bio", groups = "user validate", priority = 7)
	public void user_validate_7() {
		user.setBirthday(data.characters_20);
		boolean result = userDao.Update(user);
		assertTrue(result);
	}
	
	@Test(description = "Leave column user name blank and other column input correctly", groups = "user validate", priority = 8)
	public void user_validate_8() {
		boolean result = userDao.Update(new Users(1, data.email, null, data.password, data.phone, 1, 
				1, data.birthday, data.country, data.characters_20, data.image, timestamp, 1, null));
		assertFalse(result);
	}
	
	
	@Test(description = "Leave column user image blank and other column input correctly", groups = "user validate", priority = 9)
	public void user_validate_9() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, data.birthday, data.country, data.characters_20, null, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user dob blank and other column input correctly", groups = "user validate", priority = 10)
	public void user_validate_10() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, null, data.country, data.characters_20, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user address blank and other column input correctly", groups = "user validate", priority = 11)
	public void user_validate_11() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, data.birthday, null, data.characters_20, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user email blank and other column input correctly", groups = "user validate", priority = 12)
	public void user_validate_12() {
		boolean result = userDao.Update(new Users(1, null, data.username, data.password, data.phone, 1, 
				1, data.birthday, data.country, data.characters_20, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user bio blank and other column input correctly", groups = "user validate", priority = 13)
	public void user_validate_13() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, data.birthday, data.country,null, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user name and image blank and other column input correctly", groups = "user validate", priority = 14)
	public void user_validate_14() {
		boolean result = userDao.Update(new Users(1, data.email, null, data.password, data.phone, 1, 
				1, data.birthday, data.country, data.characters_20, null, timestamp, 1, null));
		assertFalse(result);
	}
	
	
	@Test(description = "Leave column user user name and dob blank and other column input correctly", groups = "user validate", priority = 15)
	public void user_validate_15() {
		boolean result = userDao.Update(new Users(1, data.email, null, data.password, data.phone, 1, 
				1, null, data.country, data.characters_20,  data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user user name and address blank and other column input correctly", groups = "user validate", priority = 16)
	public void user_validate_16() {
		boolean result = userDao.Update(new Users(1, data.email, null, data.password, data.phone, 1, 
				1, data.birthday, null, data.characters_20, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user user name and email blank and other column input correctly", groups = "user validate", priority = 17)
	public void user_validate_17() {
		boolean result = userDao.Update(new Users(1, null, null, data.password, data.phone, 1, 
				1, data.birthday, null, data.characters_20, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user user name and bio blank and other column input correctly", groups = "user validate", priority = 18)
	public void user_validate_18() {
		boolean result = userDao.Update(new Users(1, data.email, null, data.password, data.phone, 1, 
				1, data.birthday, data.country, null, data.image, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column image and dob blank and other column input correctly", groups = "user validate", priority = 19)
	public void user_validate_19() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, null, data.country,data.characters_20, null, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column image and address blank and other column input correctly", groups = "user validate", priority = 20)
	public void user_validate_20() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, data.birthday, null, data.characters_20, null, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column image and email blank and other column input correctly", groups = "user validate", priority = 21)
	public void user_validate_21() {
		boolean result = userDao.Update(new Users(1, null, data.username, data.password, data.phone, 1, 
				1, data.birthday, null, data.characters_20, null, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column image and bio blank and other column input correctly", groups = "user validate", priority = 22)
	public void user_validate_22() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, data.birthday, data.country, null, null, timestamp, 1, null));
		assertTrue(result);
	}
	
	@Test(description = "Leave column user dob and address blank and other column input correctly", groups = "user validate", priority = 23)
	public void user_validate_23() {
		boolean result = userDao.Update(new Users(1, data.email, data.username, data.password, data.phone, 1, 
				1, data.email, null, data.characters_20, data.image, timestamp, 1, null));
		assertTrue(result);
	}



		@Test(description = "Input all colum", groups = "user validate", priority = 31)
	public void user_validate_31() {
		user.setFullname(data.username);
		user.setPhone(data.phone);
		user.setPassword(data.password);
		user.setEmail(data.email);
		user.setCountry(data.country);
		user.setCreated_at(timestamp);
		user.setStatus(1);
		user.setGender(1);
		user.setRole(1);
		user.setImage(data.image);
		boolean result = userDao.Update(user);
		assertTrue(result);
	}


}
