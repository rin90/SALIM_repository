package com.salim.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.CategoryDao;
import com.salim.vo.BigCategory;
import com.salim.vo.SmallCategory;
//카테고리 Dao
@Repository
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SqlSessionTemplate session;

	//상위코드를 조회
	public BigCategory selectHighCode(String bigContent) {
		return session.selectOne("categoryMapper.selectHighCode", bigContent);
	}

	//대분류 코드를 조회
	public List<BigCategory> selectBigCode(int highCode) {
		return session.selectList("categoryMapper.selectBigCode", highCode);
	}

	//소분류 코드를 조회
	public List<SmallCategory> selectSmallCode(int bigCode) {
		return session.selectList("categoryMapper.selectSmallCode", bigCode);
	}

	//소분류 코드로 소분류vo, 대분류vo까지 다 조회
	public SmallCategory selectBigCodeBySmallCode(int smallCode) {
		return session.selectOne("categoryMapper.selectBigCodeBySmallCode", smallCode);
	}
	
	
	
	
	
}
