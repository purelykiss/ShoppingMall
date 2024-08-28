package kr.ac.kopo.vo;

import java.util.List;

public class Search {
	private List<String> keyword;
	private String gender;
	private int seasonyear;
	private String season;
	private int minprice;
	private int maxprice;
	private int pagecontents;
	private int curpage;
	private int totalcontents;
	private String id;	//유저용
	
	public Search(List<String> keyword, String gender, int seasonyear, String season, int minprice, int maxprice,
			int pagecontents, int curpage, int totalcontents, String id) {
		super();
		this.keyword = keyword;
		this.gender = gender;
		this.seasonyear = seasonyear;
		this.season = season;
		this.minprice = minprice;
		this.maxprice = maxprice;
		this.pagecontents = pagecontents;
		this.curpage = curpage;
		this.totalcontents = totalcontents;
		this.id = id;
	}

	public Search() {
		super();
	}
	
	public List<String> getKeyword() {
		return keyword;
	}

	public void setKeyword(List<String> keyword) {
		this.keyword = keyword;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		gender = gender.toUpperCase();
		this.gender = gender;
	}
	public int getSeasonyear() {
		return seasonyear;
	}
	public void setSeasonyear(int seasonyear) {
		this.seasonyear = seasonyear;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public int getMinprice() {
		return minprice;
	}
	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}
	public int getMaxprice() {
		return maxprice;
	}
	public void setMaxprice(int maxprice) {
		this.maxprice = maxprice;
	}
	public int getPagecontents() {
		return pagecontents;
	}
	public void setPagecontents(int pagecontents) {
		this.pagecontents = pagecontents;
	}
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	public int getTotalcontents() {
		return totalcontents;
	}
	public void setTotalcontents(int totalcontents) {
		this.totalcontents = totalcontents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", gender=" + gender + ", seasonyear=" + seasonyear + ", season=" + season
				+ ", minprice=" + minprice + ", maxprice=" + maxprice + ", pagecontents=" + pagecontents + ", curpage="
				+ curpage + ", totalcontents=" + totalcontents + ", id=" + id + "]";
	}
	
	
}
