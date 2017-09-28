package com.mgr.dto;

import java.util.Arrays;

public class AdminTeachVO {

	private String teacher_id, teacher_name, teacher_ssn, teacher_phone, teacher_hiredate, subject_id, check, check2, subcheck,
			subject_name;

	private int count_, totalrow;
	
	private String[] sub;
	
	
	

	
	
	
	public int getTotalrow() {
		return totalrow;
	}

	public void setTotalrow(int totalrow) {
		this.totalrow = totalrow;
	}

	public String[] getSub() {
		return sub;
	}

	public void setSub(String[] sub) {
		this.sub = sub;
	}

	public String getCheck2() {
		return check2;
	}

	public void setCheck2(String check2) {
		this.check2 = check2;
	}

	public String name() {
		return teacher_id;
	}
	
	

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getTeacher_ssn() {
		return teacher_ssn;
	}

	public void setTeacher_ssn(String teacher_ssn) {
		this.teacher_ssn = teacher_ssn;
	}

	public String getTeacher_phone() {
		return teacher_phone;
	}

	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}

	public String getTeacher_hiredate() {
		return teacher_hiredate;
	}

	public void setTeacher_hiredate(String teacher_hiredate) {
		this.teacher_hiredate = teacher_hiredate;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public String getSubcheck() {
		return subcheck;
	}

	public void setSubcheck(String subcheck) {
		this.subcheck = subcheck;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public int getCount_() {
		return count_;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

	@Override
	public String toString() {
		return "AdminTeachVO [teacher_id=" + teacher_id + ", teacher_name=" + teacher_name + ", teacher_ssn="
				+ teacher_ssn + ", teacher_phone=" + teacher_phone + ", teacher_hiredate=" + teacher_hiredate
				+ ", subject_id=" + subject_id + ", check=" + check + ", check2=" + check2 + ", subcheck=" + subcheck
				+ ", subject_name=" + subject_name + ", count_=" + count_ + ", sub=" + Arrays.toString(sub) + "]";
	}
	
	
	
	

}
