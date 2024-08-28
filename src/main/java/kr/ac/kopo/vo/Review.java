package kr.ac.kopo.vo;

public class Review {
	private String reviewcode;
	private String sellcode;
	private String writer;
	private String contents;
	private int score;
	private int viewcount;
	private int likecount;
	private String writtendate;
	private String modifieddate;
	public Review(String reviewcode, String sellcode, String writer, String contents, int score, int viewcount,
			int likecount, String writtendate, String modifieddate) {
		super();
		this.reviewcode = reviewcode;
		this.sellcode = sellcode;
		this.writer = writer;
		this.contents = contents;
		this.score = score;
		this.viewcount = viewcount;
		this.likecount = likecount;
		this.writtendate = writtendate;
		this.modifieddate = modifieddate;
	}
	public Review() {
		super();
	}
	public String getReviewcode() {
		return reviewcode;
	}
	public void setReviewcode(String reviewcode) {
		this.reviewcode = reviewcode;
	}
	public String getSellcode() {
		return sellcode;
	}
	public void setSellcode(String sellcode) {
		this.sellcode = sellcode;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}
	public String getModifieddate() {
		return modifieddate;
	}
	public void setModifieddate(String modifieddate) {
		this.modifieddate = modifieddate;
	}
	@Override
	public String toString() {
		return "Review [reviewcode=" + reviewcode + ", sellcode=" + sellcode + ", writer=" + writer + ", contents="
				+ contents + ", score=" + score + ", viewcount=" + viewcount + ", likecount=" + likecount
				+ ", writtendate=" + writtendate + ", modifieddate=" + modifieddate + "]";
	}
}
