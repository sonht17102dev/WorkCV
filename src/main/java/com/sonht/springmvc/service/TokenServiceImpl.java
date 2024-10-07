package com.sonht.springmvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.TokenDAO;
import com.sonht.springmvc.entity.VerificationToken;

@Service
public class TokenServiceImpl implements TokenService {
	
	@Autowired
	TokenDAO tokenDAO;

	@Override
	@Transactional
	public void save(VerificationToken verificationToken) {
		tokenDAO.save(verificationToken);
	}

	@Override
	@Transactional
	public VerificationToken findByToken(String token) {
		return tokenDAO.findByToken(token);
	}

}
