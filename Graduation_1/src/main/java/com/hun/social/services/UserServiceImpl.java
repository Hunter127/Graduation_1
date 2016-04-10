package com.hun.social.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hun.social.models.User;
import com.hun.social.repositories.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(User u) {
		return userDao.getUser(u);
	}

	@Override
	public boolean register(User u) {
		return userDao.add(u);
	}

	@Override
	public boolean check(String UID) {
		return userDao.check(UID);
	}

}
