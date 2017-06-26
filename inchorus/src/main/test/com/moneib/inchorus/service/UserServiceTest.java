package com.moneib.inchorus.service;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.moneib.inchorus.domain.User;

@RunWith(SpringRunner.class)	//Needed to run the tests using SpringBoot.
@SpringBootTest
public class UserServiceTest {
	@Autowired
	UserService service;

	User newUser;

	@Before
	public void setUp() {
		newUser = new User();

		newUser.setAddress("Nasr City");
		newUser.setDateOfBirth(new Date());
		newUser.setEmail("muh@gmx.us");
		newUser.setGender("Male");
		newUser.setProfile("My profile");
		newUser.setUserName("mmoneib");
	}

	@Test
	public void addUser() {
		User user = service.addUser(newUser);
		
		assertNotNull(user);
		assertNotNull(user.getID());
		assertNotEquals(0, user.getID());
		assertEquals("Nasr City", newUser.getAddress());
		assertEquals("muh@gmx.us", newUser.getEmail());
		assertEquals("Male", newUser.getGender());
		assertEquals("My profile", newUser.getProfile());
		assertEquals("mmoneib", newUser.getUserName());
	}

}
