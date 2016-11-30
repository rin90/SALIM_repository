package com.salim.util;

public class PagingBean {
	private int page; // 현재 페이지

	private int total; // 전체 글 개수

	private int currentItem = Constants.ITEMS; // 한 페이지 보여줄 글 개수

	private int currentPageGroup = Constants.CURRENT_PAGE_GROUP; // 한 번에 보여줄 페이지
																	// 개수

	public PagingBean(int page, int toral) {
		this.page = page;
		this.total = total;
	}

	// 현재 페이지 반환
	public int currentPage() {
		return page;
	}
	
	//총페이지 개수
	public int getTotalPage() {
		if (total % currentItem != 0) {
			return total / currentItem+ 1;
		} else {
			return total / currentItem;
		}

	}
	
	//총 페이지 그룹 개수 반환
	public int getTotalPageGroup(){
		if(getTotalPage()%currentPageGroup != 0){
			return getTotalPage()/currentPageGroup +1;
		}else{
			return getTotalPage()/currentPageGroup;
		}
	}
	//현재 페이지가 속한 페이지 그룹을 반환
	public int getCurrentPageGroup(){
		if(page%currentPageGroup != 0){
			return page/currentPageGroup +1;
		}else{
			return page/currentPageGroup;
		}
	}
	//현재 페이지가 속한 페이지 그룹의 첫번째 페이지를 반환 int
	public int getBeginPage(){
		return (getCurrentPageGroup()-1)*currentPageGroup+1;
	}
	//현재 페이지가 속한 페이지 그룹의 마지막 페이지를 반환 int
	public int getEndPage(){
		return getCurrentPageGroup()*currentPageGroup;
	}
	//다음페이지 그룹의 존재여부 boolean
	public boolean isNextGroup(){
		boolean flag = false;
		if(getTotalPageGroup()>getCurrentPageGroup()){
			flag = true;
			return flag;
		}
		return flag;
	}
	//이전페이지 그룹의 존재여부 boolean
	public boolean isPreviousGroup(){
		boolean flag = false;
		if(getCurrentPageGroup() != 1){
			flag = true;
			return flag;
		}
		return flag;
	}
}
