package com.sonht.springmvc.service;

import com.sonht.springmvc.entity.VerificationToken;

public interface TokenService {

	void save(VerificationToken verificationToken);

	VerificationToken findByToken(String token);

}
