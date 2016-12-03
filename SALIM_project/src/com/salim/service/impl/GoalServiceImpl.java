package com.salim.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.salim.dao.GoalDao;
import com.salim.service.GoalService;
import com.salim.vo.Goal;

@Service
public class GoalServiceImpl implements GoalService{	// 비지니스 로직
	@Autowired
	private GoalDao dao;
	
	/*한 로직 안에서 처리될 수 있게 변경해야함. 값을 받아오는 부분은 컨트롤러에서 작업해주어야 함. */

	@Override	@Transactional
	public Goal applyDB(Goal goal) {
		int length = goal.getGoal().trim().length();
		System.out.println("길이는 : " + length);
		
		// 1단계. 조회
		Goal result = dao.selectGoal(goal);
		System.out.print("goalService : ");
		
		// 2단계. 비교에 따른 결과 조회 - 조회결과 없으면서 내용이 있으면 insert, 내용이 없으면 delete, 내용이 있으면 update
		if(result==null && length==0){
			// 아무일도 일어나선 안됨.
			goal = null;	// 이거가 맞겠징?
			System.out.println("등록된적이 없데.");
		}else if(result==null){	// 조회 결과x, 내용 o
			System.out.println("추가한다던데?");
			dao.insertGoal(goal);
		}else if(result!=null && length==0){
			System.out.println("삭제하겠다! 목표따위!!!");
			dao.deleteGoal(result.getNum());
			goal = null;	// 삭제 됐으니까 내용을 없애는거지.
		}else{
			System.out.println("수정할껀데?!");
			goal.setNum(result.getNum());
			dao.updateGoal(goal);
		}
		return goal;
	}

}
