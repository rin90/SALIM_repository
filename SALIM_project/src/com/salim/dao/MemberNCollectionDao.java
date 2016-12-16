package com.salim.dao;



import java.util.HashMap;

import com.salim.vo.MemberNCollection;

public interface MemberNCollectionDao {

	
	public void insertmemberNCollection(MemberNCollection collection);

	public int deleteMemberNCollectionByCollectionId(String collectionId);
	
	public MemberNCollection selectByMemberIdAndCollectionId(HashMap<String,String> map);
}
