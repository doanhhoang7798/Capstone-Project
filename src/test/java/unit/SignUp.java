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

public class SignUp extends AbstractTestNGSpringContextTests {
	
	public Timestamp timestamp = new Timestamp(System.currentTimeMillis());

	@Autowired(required = true)
	UserDao userDao;
	Users user;

	private static Validator validator;

	@BeforeMethod
	void beforeMethod() {
		user = new Users();
		
	}
	
	@AfterMethod
	void deleteUser() {
		for (Users user : userDao.all()) {			
			if(user.getId()!=1) {
				userDao.Delete(user);
			}
		}
	}

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	


	@Test(description = "All column empty.", groups = "user validate", priority = 1)
	public void user_validate_1() {
		boolean result = userDao.Create(user);
		assertFalse(result);
	}

	@Test(description = "Only input name", groups = "user validate", priority = 2)
	public void user_validate_2() {
		user.setFullname(data.username);
		boolean result = userDao.Create(user);
		assertFalse(result);
	}
	
	@Test(description = "Only input phone", groups = "user validate", priority = 3)
	public void user_validate_3() {
		user.setPhone(data.phone);
		boolean result = userDao.Create(user);
		assertFalse(result);
	}
	
	@Test(description = "Only input password", groups = "user validate", priority = 4)
	public void user_validate_4() {
		user.setPassword(data.password);
		boolean result = userDao.Create(user);
		assertFalse(result);
	}
	
	@Test(description = "Only input name and phone", groups = "user validate", priority = 5)
	public void user_validate_5() {
		user.setFullname(data.username);
		user.setPhone(data.phone);
		boolean result = userDao.Create(user);
		assertFalse(result);
	}
	
	
	@Test(description = "Only input name and password", groups = "user validate", priority = 6 )
	public void user_validate_6() {
		user.setFullname(data.username);
		user.setPassword(data.password);
		boolean result = userDao.Create(user);
		assertFalse(result);
	}
	
	@Test(description = "Only input phone and password", groups = "user validate", priority = 7)
	public void user_validate_7() {
		user.setPhone(data.phone);
		user.setPassword(data.password);
		boolean result = userDao.Create(user);
		assertFalse(result);
	}	
	
	@Test(description = "Leave column user name blank and other column input correctly.", groups = "user validate", priority = 8)
	public void user_validate_8() {
		boolean result = userDao.Create(new Users(data.email, null, data.password, data.phone, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}
	
	@Test(description = "Leave column phone blank and other column input correctly.", groups = "user validate", priority = 9)
	public void user_validate_9() {
		boolean result = userDao.Create(new Users(data.email, data.username, data.password, null, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}
	
	@Test(description = "Leave column password blank and other column input correctly.", groups = "user validate", priority = 10)
	public void user_validate_10() {
		boolean result = userDao.Create(new Users(data.email, data.username, null, data.phone, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}

	@Test(description = "Leave column name and phone blank, other column input correctly.", groups = "user validate", priority = 11)
	public void user_validate_11() {
		boolean result = userDao.Create(new Users(data.email, null, data.password, null, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}
	
	@Test(description = "Leave column name and password blank, other column input correctly.", groups = "user validate", priority = 12)
	public void user_validate_12() {
		boolean result = userDao.Create(new Users(data.email, null, null, data.phone, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}
	
	@Test(description = "Leave column phone and password blank, other column input correctly.", groups = "user validate", priority = 13)
	public void user_validate_13() {
		boolean result = userDao.Create(new Users(data.email, data.username, null, null, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}
	
	@Test(description = "Leave column name, phone and password blank, other column input correctly.", groups = "user validate", priority = 14)
	public void user_validate_14() {
		boolean result = userDao.Create(new Users(data.email, null, null, null, 
				data.country, timestamp, 1, 1, 1, data.image));
		assertFalse(result);
	}
	
	
	@Test(description = "input column name 2 characters and other column input correctly.", groups = "user validate", priority = 15)
	public void user_validate_15() {
		user.setFullname(data.characters_2);
		user.setPhone(data.phone);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "size must be between 3 and 40");		
	}	
	
	@Test(description = "input column name 41 characters and other column input correctly.", groups = "user validate", priority = 16)
	public void user_validate_16() {
		user.setFullname(data.characters_41);
		user.setPhone(data.phone);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "size must be between 3 and 40");		
	}	
	
	@Test(description = "input column phone 9 characters not number and other column input correctly.", groups = "user validate", priority = 17)
	public void user_validate_17() {
		user.setFullname(data.username);
		user.setPhone(data.characters_9);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");
	}	
	
	@Test(description = "input column phone 9-digit random number and other column input correctly.", groups = "user validate", priority = 18)
	public void user_validate_18() {
		user.setFullname(data.username);
		user.setPhone(data.number_9);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");
	}
	
	@Test(description = "input column phone a 9-digit number beginning with 03 and other column input correctly.", groups = "user validate", priority = 19)
	public void user_validate_19() {
		user.setFullname(data.username);
		user.setPhone(data.number_9_03);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");
	}
	
	@Test(description = "input column phone a 9-digit number beginning with 09 and other column input correctly.", groups = "user validate", priority = 20)
	public void user_validate_20() {
		user.setFullname(data.username);
		user.setPhone(data.number_9_09);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");	
	}
	
	@Test(description = "input column phone a 9-characters number beginning with 03 and other column input correctly.", groups = "user validate", priority = 21)
	public void user_validate_21() {
		user.setFullname(data.username);
		user.setPhone(data.characters_9_03);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");
	}
	
	@Test(description = "input column phone a 9-characters number beginning with 09 and other column input correctly.", groups = "user validate", priority = 22)
	public void user_validate_22() {
		user.setFullname(data.username);
		user.setPhone(data.characters_9_09);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");
	}
	
	

	@Test(description = "input column phone 11 characters not number and other column input correctly.", groups = "user validate", priority = 23)
	public void user_validate_23() {
		user.setFullname(data.username);
		user.setPhone(data.characters_11);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");		
	}	
	
	@Test(description = "input column phone 11-digit random number and other column input correctly.", groups = "user validate", priority = 24)
	public void user_validate_24() {
		user.setFullname(data.username);
		user.setPhone(data.number_11);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");		
	}
	
	@Test(description = "input column phone a 11-digit number beginning with 03 and other column input correctly.", groups = "user validate", priority = 25)
	public void user_validate_25() {
		user.setFullname(data.username);
		user.setPhone(data.number_11_03);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");		
	}
	
	@Test(description = "input column phone a 11-digit number beginning with 09 and other column input correctly.", groups = "user validate", priority = 26)
	public void user_validate_26() {
		user.setFullname(data.username);
		user.setPhone(data.number_11_09);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");		
	}
	
	@Test(description = "input column phone a 11-characters number beginning with 03 and other column input correctly.", groups = "user validate", priority = 27)
	public void user_validate_27() {
		user.setFullname(data.username);
		user.setPhone(data.characters_11_03);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");		
	}
	
	@Test(description = "input column phone a 11-characters number beginning with 09 and other column input correctly.", groups = "user validate", priority = 28)
	public void user_validate_28() {
		user.setFullname(data.username);
		user.setPhone(data.characters_11_09);
		user.setEmail(data.email);
		user.setPassword(data.password);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "length must be between 10 and 10");		
	}
	
	
	//password 
	@Test(description = "input column password a 7-characters and other column input correctly.", groups = "user validate", priority = 29)
	public void user_validate_29() {
		user.setFullname(data.username);
		user.setPhone(data.phone);
		user.setEmail(data.email);
		user.setPassword(data.characters_7);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "size must be between 8 and 20");		
	}
	
	@Test(description = "input column password a 21-characters and other column input correctly.", groups = "user validate", priority = 30)
	public void user_validate_30() {
		user.setFullname(data.username);
		user.setPhone(data.phone);
		user.setEmail(data.email);
		user.setPassword(data.characters_21);
		Set<ConstraintViolation<Users>> constraintViolations = validator.validate(user);
		assertEquals(constraintViolations.iterator().next().getMessage(), "size must be between 8 and 20");		
	}	


		@Test(description = "Register success", groups = "user validate", priority = 31)
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
		boolean result = userDao.Create(user);
		assertTrue(result);
	}


}
