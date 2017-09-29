package com.mgr.dto;

import lombok.Data;

@Data
public class AdminTeachVO {

	private String teacher_id, teacher_name, teacher_ssn, teacher_phone, teacher_hiredate, subject_id, check, check2, subcheck,
			subject_name, key, value;

	private int count_, totalrow, totalpage;
	
	private String[] sub;
	
	
	
	
	

}
