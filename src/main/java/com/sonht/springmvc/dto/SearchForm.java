package com.sonht.springmvc.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class SearchForm {
	@NotNull(message = "Hãy nhập từ khoá tìm kiếm")
	@NotEmpty(message = "Hãy nhập từ khoá tìm kiếm")
	private String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
