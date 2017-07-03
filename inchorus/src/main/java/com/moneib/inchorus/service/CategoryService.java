package com.moneib.inchorus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moneib.inchorus.domain.CategoryRepository;
import com.moneib.inchorus.domain.Category;

@Component
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

	public List<Category> getAllCategory() {
		List<Category> category = new ArrayList<>();
		categoryRepository.findAll().forEach(category::add);
		return category;
	}

	public Category getCategory(long id) {
		return categoryRepository.findOne(id);
	}

	public Category addCategory(Category category) {
		return categoryRepository.save(category);
	}

	public Category updateCategory(long id, Category category) {
		return categoryRepository.save(category);
	}

	public void deleteCategory(Long id) {
		categoryRepository.delete(id);

	}

	public void deleteAllCategory() {
		categoryRepository.deleteAll();

	}

}
