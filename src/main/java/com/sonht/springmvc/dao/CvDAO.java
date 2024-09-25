package com.sonht.springmvc.dao;

import com.sonht.springmvc.entity.Cv;

public interface CvDAO {

	void deleteCv(String id);

	Cv getCv(String idCv);

}
