package com.moneib.inchorus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moneib.inchorus.domain.User;
import com.moneib.inchorus.domain.UserRepository;

@Component	//To be found through auto-wiring.
public class UserService {
	@Autowired
	UserRepository userRepository;

	public User addUser(User user) {
		return userRepository.save(user);
	}
}
