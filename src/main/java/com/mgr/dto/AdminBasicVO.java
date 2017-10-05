package com.mgr.dto;

import java.util.List;

import lombok.Data;

@Data
public class AdminBasicVO {
	
	private String course_id, course_name, subject_id, subject_name, book_id, book_name, publisher, book_imgname, class_id, class_name, check, check2, key, value;
	private int count_, courselistcheck, jungwon, start;


}
