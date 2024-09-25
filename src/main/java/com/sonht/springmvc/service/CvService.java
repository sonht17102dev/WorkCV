package com.sonht.springmvc.service;

import com.sonht.springmvc.entity.Cv;

public interface CvService {
	void deleteCv(String id);

	Cv getCv(String idCv);

}
