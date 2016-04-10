package com.hun.social.services;

import com.hun.social.models.User;

public interface UserService {
	public User login(User u);
	
	public boolean register(User u);
	
	public boolean check(String UID);

}
