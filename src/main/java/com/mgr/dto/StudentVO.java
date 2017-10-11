package com.mgr.dto;

import lombok.Data;

@Data
public class StudentVO {
	
	private String student_id, student_name, student_ssn, student_phone, open_course_id, course_name, class_name, course_start_day, course_end_day
	,open_sub_id, subject_name, sub_start_day, sub_end_day, book_name, teacher_name, chulsuk_total_grade, test_date, test_munje, pw, newpw;
	
	private int count_, filki_total_grade, silki_total_grade, chulsuk_grade, filki_grade, silki_grade;

}
