package com.moneib.inchorus.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.moneib.inchorus.domain.Category;

@RunWith(SpringRunner.class) // Needed to run the tests using SpringBoot.
@SpringBootTest
public class CategoryServiceTest {
	@Autowired
	CategoryService categoryService;
	Category newCategory;
	long id;

	@Before
	public void setUp() {

		newCategory = new Category();
		newCategory.setCategoryName("Inchorus");
	}

	@Test
	public void addCategory() {
		Category category = categoryService.addCategory(newCategory);
		assertNotNull(category);
		assertNotNull(category.getID());
		assertNotEquals(0, category.getID());
		assertEquals("Inchorus", category.getCategoryName());
	}

	@Test
	public void getCategoryByID() {
		// add then update what was added .
		Category category = categoryService.addCategory(newCategory);
		id = category.getID();
		newCategory.setID(id);
		Category getcategory = categoryService.getCategory(id);
		assertEquals(id, getcategory.getID());
		assertEquals("Inchorus", getcategory.getCategoryName());
	}

	@Test
	public void updateCategory() {
		Category category = categoryService.addCategory(newCategory);
		id = category.getID();
		newCategory.setID(id);
		newCategory.setCategoryName("Inchorus Update Category");

		Category categoryUpdate = categoryService.updateCategory(id, newCategory);
		assertNotNull(categoryUpdate);
		assertNotNull(categoryUpdate.getID());
		assertNotEquals(0, categoryUpdate.getID());
		assertEquals("Inchorus Update Category", categoryUpdate.getCategoryName());
	}

	@Test
	public void deleteCategory() {
		Category category = categoryService.addCategory(newCategory);
		id = category.getID();
		categoryService.deleteCategory(id);
	}

	@Test
	public void getAllCategory() {
		//categoryService.deleteAllCategory();
		categoryService.addCategory(newCategory);
		int categorySize = categoryService.getAllCategory().size();
		assertEquals(1, categorySize);
	}

}
