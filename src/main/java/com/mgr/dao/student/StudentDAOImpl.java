package com.mgr.dao.student;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.StudentVO;

@Repository
public class StudentDAOImpl implements StudentDAO {
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.StudentMapper";

	@Override
	public List<StudentVO> stuCourseList(StudentVO t) {
		List<StudentVO> result = session.selectList(namespace+".stuCourseList", t);
		return result;
	}

	@Override
	public List<StudentVO> stuCourseListgrade(StudentVO t) {
		List<StudentVO> result = session.selectList(namespace+".stuCourseListgrade", t);
		return result;
	}
	
	@Override
	public String stuInfo(String id_) {
		String result = session.selectOne(namespace+".stuInfo", id_);
		return result;
	}
	
	@Override
	public StudentVO stuInfoModList(StudentVO t) {
		StudentVO result = session.selectOne(namespace+".stuInfoModList", t);
		return result;
	}

	@Override
	public int stuInfoModify(StudentVO t) {
		int result = session.update(namespace+".stuInfoModify",t);
		return result;
	}
	
	
	@Override
	public int stumodifycheck(StudentVO t) {
		int result = session.selectOne(namespace+".stumodifycheck",t);
		return result;
	}

	@Override
	public int stuPwModify(StudentVO t) {
		int result = session.update(namespace+".stuPwModify",t);
		return result;
	}
	
	
	
	
	
	
	

}
