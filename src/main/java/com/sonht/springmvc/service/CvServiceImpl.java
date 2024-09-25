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
	public void deleteCv(String id) {
		cvDAO.deleteCv(id);
	}

	@Override
	@Transactional
	public Cv getCv(String idCv) {
		return cvDAO.getCv(idCv);
	}


}
