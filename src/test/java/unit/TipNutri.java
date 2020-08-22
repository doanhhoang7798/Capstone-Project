package unit;

import static org.testng.Assert.*;
import java.util.Set;
import javax.validation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.*;
import org.springframework.test.context.testng.*;
import org.testng.annotations.*;
import dao.*;

import connecter.data;

@Test
@ContextConfiguration(locations = { "../connecter/spring-servlet.xml" })

public class TipNutri extends AbstractTestNGSpringContextTests {

	@Autowired(required = true)
	TipNutriDao TipNutriDao;
	model.TipNutri TipNutri;
	
	@Autowired(required = true)
	UserDao userDao;

	private static Validator validator;

	@BeforeMethod
	void beforeMethod() {
		TipNutri = new model.TipNutri();
	}

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	@Test(description = "All column empty.", groups = "TipNutri validate", priority = 1)
	public void TipNutri_validate_1() {
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);
	}

	@Test(description = "Only input column title.", groups = "TipNutri validate", priority = 2)
	public void TipNutri_validate_2() {
		TipNutri.setTitle(data.title);
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);

	}

	@Test(description = "Only input column content.", groups = "TipNutri validate", priority = 3)
	public void TipNutri_validate_3() {
		TipNutri.setContent(data.content);
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);

	}

	@Test(description = "Only input column type.", groups = "TipNutri validate", priority = 4)
	public void TipNutri_validate_4() {
		TipNutri.setType(data.type);
		;
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);

	}

	@Test(description = "Only input column author.", groups = "TipNutri validate", priority = 5)
	public void TipNutri_validate_5() {
		TipNutri.setAuthor(data.author);
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);

	}

	@Test(description = "Only input column image.", groups = "TipNutri validate", priority = 6)
	public void TipNutri_validate_6() {
		TipNutri.setImage(data.image);
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);

	}

	@Test(description = "Only input column user_id.", groups = "TipNutri validate", priority = 7)
	public void TipNutri_validate_7() {
		TipNutri.setUser(userDao.all().get(0));
		boolean result = TipNutriDao.Create(TipNutri);
		assertFalse(result);

	}

	@Test(description = "Leave column image blank and other column input correctly.", groups = "TipNutri validate", priority = 8)
	public void TipNutri_validate_8() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at,
				data.kind, null, userDao.all().get(0)));
		assertFalse(result);

	}

	@Test(description = "Leave column title blank and other column input correctly.", groups = "TipNutri validate", priority = 9)
	public void TipNutri_validate_9() {
		boolean result = TipNutriDao.Create(new model.TipNutri(null, data.content, data.type, data.author, data.created_at,
				data.kind, data.image, userDao.all().get(0)));
		assertFalse(result);

	}

	@Test(description = "Leave column content blank and other column input correctly.", groups = "TipNutri validate", priority = 10)
	public void TipNutri_validate_10() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, null, data.type, data.author, data.created_at,
				data.kind, data.image, userDao.all().get(0)));
		assertFalse(result);

	}

	@Test(description = "Leave column type blank and other column input correctly.", groups = "TipNutri validate", priority = 11)
	public void TipNutri_validate_11() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, null, data.author, data.created_at,
				data.kind, data.image, userDao.all().get(0)));
		assertFalse(result);
	}

	@Test(description = "Leave column author blank and other column input correctly.", groups = "TipNutri validate", priority = 12)
	public void TipNutri_validate_12() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, null, data.created_at,
				data.kind, data.image, userDao.all().get(0)));
		assertFalse(result);
	}

	@Test(description = "Leave column kind blank and other column input correctly.", groups = "TipNutri validate", priority = 13)
	public void TipNutri_validate_13() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at,
				null, data.image, userDao.all().get(0)));
		assertFalse(result);
	}

	@Test(description = "Leave column image blank and other column input correctly.", groups = "TipNutri validate", priority = 14)
	public void TipNutri_validate_14() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at,
				data.kind, null, userDao.all().get(0)));
		assertFalse(result);
	}

	@Test(description = "Leave column user blank and other column input correctly.", groups = "TipNutri validate", priority = 15)
	public void TipNutri_validate_15() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at,
				data.kind, data.image, null));
		assertFalse(result);
	}

	@Test(description = "input column title 19 characters and other column input correctly.", groups = "TipNutri validate", priority = 16)
	public void TipNutri_validate_16() {
		TipNutri.setAuthor(data.author);
		TipNutri.setTitle(data.characters_19);
		TipNutri.setContent(data.content);
		TipNutri.setCreated_at(data.created_at);
		TipNutri.setImage(data.image);
		TipNutri.setType(data.type);
		TipNutri.setKind(data.kind);
		TipNutri.setUser(userDao.all().get(0));
		Set<ConstraintViolation<model.TipNutri>> constraintViolations = validator.validate(TipNutri);
		assertEquals("size must be between 20 and 100", constraintViolations.iterator().next().getMessage());
	}

	@Test(description = "input column title 20 characters and other column input correctly.", groups = "TipNutri validate", priority = 17)
	public void TipNutri_validate_17() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.characters_20, data.content, data.type, data.author,
				data.created_at, data.kind, data.image, null));
		assertFalse(result);
	}

	@Test(description = "input column title 100 characters and other column input correctly.", groups = "TipNutri validate", priority = 18)
	public void TipNutri_validate_18() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.characters_100, data.content, data.type, data.author,
				data.created_at, data.kind, data.image, null));
		assertFalse(result);
	}

	@Test(description = "input column title 101 characters and other column input correctly.", groups = "TipNutri validate", priority = 19)
	public void TipNutri_validate_19() {
		TipNutri.setAuthor(data.author);
		TipNutri.setTitle(data.characters_101);
		TipNutri.setContent(data.content);
		TipNutri.setCreated_at(data.created_at);
		TipNutri.setImage(data.image);
		TipNutri.setType(data.type);
		TipNutri.setKind(data.kind);
		TipNutri.setUser(userDao.all().get(0));
		Set<ConstraintViolation<model.TipNutri>> constraintViolations = validator.validate(TipNutri);
		assertEquals("size must be between 20 and 100", constraintViolations.iterator().next().getMessage());
	}

	@Test(description = "input column content 199 characters and other column input correctly.", groups = "TipNutri validate", priority = 20)
	public void TipNutri_validate_20() {
		TipNutri.setAuthor(data.author);
		TipNutri.setTitle(data.title);
		TipNutri.setContent(data.characters_199);
		TipNutri.setCreated_at(data.created_at);
		TipNutri.setImage(data.image);
		TipNutri.setType(data.type);
		TipNutri.setKind(data.kind);
		TipNutri.setUser(userDao.all().get(0));
		Set<ConstraintViolation<model.TipNutri>> constraintViolations = validator.validate(TipNutri);
		assertEquals("size must be between 200 and 2147483647", constraintViolations.iterator().next().getMessage());
	}

	@Test(description = "input column content 200 characters and other column input correctly.", groups = "TipNutri validate", priority = 21)
	public void TipNutri_validate_21() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.characters_200, data.type, data.author,
				data.created_at, data.kind, data.image, null));
		assertFalse(result);
	}

	@Test(description = "input column author 19 characters and other column input correctly.", groups = "TipNutri validate", priority = 22)
	public void TipNutri_validate_22() {
		TipNutri.setAuthor(data.characters_19);
		TipNutri.setTitle(data.title);
		TipNutri.setContent(data.content);
		TipNutri.setCreated_at(data.created_at);
		TipNutri.setImage(data.image);
		TipNutri.setType(data.type);
		TipNutri.setKind(data.kind);
		TipNutri.setUser(userDao.all().get(0));
		Set<ConstraintViolation<model.TipNutri>> constraintViolations = validator.validate(TipNutri);
		assertEquals("size must be between 20 and 255", constraintViolations.iterator().next().getMessage());
	}

	@Test(description = "input column author 20 characters and other column input correctly.", groups = "TipNutri validate", priority = 23)
	public void TipNutri_validate_23() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.characters_20,
				data.created_at, data.kind, data.image, null));
		assertFalse(result);
	}

	@Test(description = "input column author 255 characters and other column input correctly.", groups = "TipNutri validate", priority = 24)
	public void TipNutri_validate_24() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.characters_255,
				data.created_at, data.kind, data.image, null));
		assertFalse(result);
	}

	@Test(description = "input column author 256 characters and other column input correctly.", groups = "TipNutri validate", priority = 25)
	public void TipNutri_validate_25() {
		TipNutri.setAuthor(data.characters_256);
		TipNutri.setTitle(data.title);
		TipNutri.setContent(data.content);
		TipNutri.setCreated_at(data.created_at);
		TipNutri.setImage(data.image);
		TipNutri.setType(data.type);
		TipNutri.setKind(data.kind);
		TipNutri.setUser(userDao.all().get(0));
		Set<ConstraintViolation<model.TipNutri>> constraintViolations = validator.validate(TipNutri);
		assertEquals("size must be between 20 and 255", constraintViolations.iterator().next().getMessage());
	}

	@Test(description = "Create TipNutri", groups = "create TipNutri", priority = 26)
	public void TipNutri_create_26() {
		boolean result = TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at,
				data.kind, data.image, userDao.all().get(0)));
		assertTrue(result);
	}

	@Test(description = "Delete record exists.", groups = "delete TipNutri", priority = 27)
	public void TipNutri_delete_27() {
		TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at, data.kind,
				data.image, userDao.all().get(0)));
		boolean result = TipNutriDao.Delete(TipNutriDao.list().get(0).getId());
		assertTrue(result);
	}

	@Test(description = "Delete record not exists.", groups = "delete TipNutri", priority = 28)
	public void TipNutri_delete_28() {
		TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at, data.kind,
				data.image, userDao.all().get(0)));
		int Id = (TipNutriDao.list().get(TipNutriDao.list().size() - 1).getId()) + 1;
		boolean result = TipNutriDao.Delete(Id);
		assertFalse(result);

	}

	@Test(description = "Get list TipNutri.", groups = "list TipNutri", priority = 29)
	public void TipNutri_list_29() {
		TipNutriDao.Create(new model.TipNutri(data.title, data.content, data.type, data.author, data.created_at, data.kind,
				data.image, userDao.all().get(0)));
		assertNotNull(TipNutriDao.list());

	}

	@Test(description = "Find by ID.", groups = "list TipNutri", priority = 30)
	public void TipNutri_findBy_id_30() {
		assertNotNull(TipNutriDao.Delete(TipNutriDao.list().get(0).getId()));

	}

	@Test(description = "Find by type.", groups = "list TipNutri", priority = 31)
	public void TipNutri_findBy_type_31() {
		assertNotNull(TipNutriDao.filterByType(data.type));

	}

	@Test(description = "Find by type and kind.", groups = "list TipNutri", priority = 32)
	public void TipNutri_findBy_typeOrkind_32() {
		assertNotNull(TipNutriDao.findByTypeKind(data.type, data.kind, 0, 12));

	}

	@Test(description = "Update TipNutri exists.", groups = "Update TipNutri", priority = 33)
	public void TipNutri_update_exists_33() {
		model.TipNutri TipNutri = TipNutriDao.list().get(0);
		TipNutri.setAuthor("Author change after update successfully");
		boolean result = TipNutriDao.Update(TipNutri);
		assertTrue(result);

	}

	@Test(description = "Update TipNutri not exists.", groups = "Update TipNutri", priority = 34)
	public void TipNutri_update_not_exists_34() {
		model.TipNutri TipNutri = TipNutriDao.findByID(0);
		boolean result = TipNutriDao.Update(TipNutri);
		assertFalse(result);

	}

}
