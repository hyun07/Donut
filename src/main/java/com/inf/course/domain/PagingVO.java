package com.inf.course.domain;

import lombok.Data;

@Data
public class PagingVO {
	private String order;
	private int page;
	private int pages;
	private int size;
	private int begin;
	private int end;
}
