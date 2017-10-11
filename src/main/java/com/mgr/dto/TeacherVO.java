package com.mgr.dto;

import lombok.Data;

@Data
public class TeacherVO {
	
	private String teacher_id, teacher_name, teacher_ssn, teacher_phone, open_course_id, course_name, class_name, course_start_day, course_end_day
	,open_sub_id, subject_name, sub_start_day, sub_end_day, book_name,book_imgname,  test_date, test_munje, pw, newpw, key, value, student_regdate
	,student_phone, finish_day, student_id, student_name, student_ssn;
	
	private int chulsuk_total_grade,count_, filki_total_grade, silki_total_grade, chulsuk_grade, filki_grade, silki_grade, student_count, jungwon, totalpage, totalrow;

}
