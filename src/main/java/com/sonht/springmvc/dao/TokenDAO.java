package com.sonht.springmvc.dao;

import com.sonht.springmvc.entity.VerificationToken;

public interface TokenDAO {

	void save(VerificationToken verificationToken);

	VerificationToken findByToken(String token);

}
