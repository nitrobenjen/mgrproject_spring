package com.mgr.dto;

import java.util.List;

import lombok.Data;

@Data
public class AdminCourseVO {

	private String open_course_id, course_name, class_name, course_start_day, course_end_day, subcount, key, value,
			course_id, class_id, student_id, student_name, student_ssn, student_phone, student_regdate, finish_day,
			teacher_name, book_name, sub_start_day, sub_end_day, subject_name, open_sub_id, addcheck, teacher_id, book_id, subject_id, delcheck, chulsuk_total_grade, filki_total_grade, silki_total_grade, test_date, chulsuk_grade, filki_grade, silki_grade;

	private int jungwon, studentcount, totalrow, totalpage, count_;

	private List<AdminBasicVO> course, class_;

}
