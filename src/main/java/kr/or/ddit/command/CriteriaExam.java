package kr.or.ddit.command;

import lombok.ToString;

@ToString
public class CriteriaExam {
	
	private int page=1;
	private int perPageNum=4;
	private String searchType;
	private String keyword;
	
	private String lecCd;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<1) {
			this.page=1;
		}else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.perPageNum = 4;
		}else {
			this.perPageNum = perPageNum;
		}
	}
	
	public int getStartRowNum() {
		return (this.page-1)*perPageNum;		
	}
	public String getLecCd() {
		return lecCd;
	}
	public void setLecCd(String lecCd) {
		this.lecCd = lecCd;
	}
	
}






