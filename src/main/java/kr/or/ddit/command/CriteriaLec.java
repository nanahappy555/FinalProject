package kr.or.ddit.command;

import lombok.ToString;

@ToString
public class CriteriaLec {
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	private int page=1;
	private int perPageNum=5;
	private String searchType;
	private String searchType2;
	private String searchType3;
	private String keyword;
	
	private String memId;
	private String lecCd;
	private String stuCd;
	private String profId;
	private String receiverId;
	private String senderId;
	
	
	
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
			this.perPageNum = 5;
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
	public String getStuCd() {
		return stuCd;
	}
	public void setStuCd(String stuCd) {
		this.stuCd = stuCd;
	}
	public String getProfId() {
		return profId;
	}
	public void setProfId(String profId) {
		this.profId = profId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	
}






