package com.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mgr.dto.AdminTeachVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.management.mapper.AdminMapper";

	
	

	@Override
	public List<AdminTeachVO> adminTeachListAll(AdminTeachVO t) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachListAll", t);
		return result;
	}


	@Override
	public List<AdminTeachVO> adminTeachSublist(String teacher_id) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachSublist", teacher_id);
		return result;
	}



	@Override
	public int adminTeachDelsub(String teacher_id) {
	
		int result = session.delete(namespace + ".adminTeachDelsub", teacher_id);
		return result;
	}


	@Override
	public int adminTeachModifyinfo(AdminTeachVO t) {
		int result = session.update(namespace + ".adminTeachModifyinfo", t);
		return result;
	}


	@Override
	public List<AdminTeachVO> adminBasicsublist() {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminBasicSubList");
		return result;
	}


	@Override
	public int adminTeachsubInsert(AdminTeachVO t) {
		int result = session.insert(namespace + ".adminTeachsubInsert", t);
		return result;
	}
	@Override
	public List<AdminTeachVO> adminTeachNocheck(String teacher_id) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachNocheck", teacher_id);
		return result;
	}


	@Override
	public String adminTeachId() {
		String result = session.selectOne(namespace + ".adminTeachId");
		return result;
	}


	@Override
	public int adminTeachadd(AdminTeachVO t) {
		int result = session.insert(namespace + ".adminTeachadd", t);
		return result;
	}


	@Override
	public List<AdminTeachVO> adminTeachdisable1(AdminTeachVO t) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachdisable1", t);
		return result;
	}


	@Override
	public List<AdminTeachVO> adminTeachdisable2(AdminTeachVO t) {
		List<AdminTeachVO> result = session.selectList(namespace + ".adminTeachdisable2", t);
		return result;
	}


	@Override
	public int adminTeachDel(String teacher_id) {
		int result = session.insert(namespace + ".adminTeachDel", teacher_id);
		return result;
	}
	
	
	
	
	
	
	
	

}
