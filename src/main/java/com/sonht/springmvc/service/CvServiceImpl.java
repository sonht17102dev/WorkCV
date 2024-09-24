package com.sonht.springmvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonht.springmvc.dao.CvDAO;
import com.sonht.springmvc.entity.Cv;

@Service
public class CvServiceImpl implements CvService {

	@Autowired
	CvDAO cvDAO;
	
	@Override
	@Transactional
	public Cv deleteCv(String id) {
		return cvDAO.deleteCv(id);
	}

}
