package kr.ac.kopo.vo;

public class GoodsPicture {
	private String picturecode;
	private String filename;
	private String sellcode;
	private String picturepath;
	private String picturetype;
	private int priority;
	private String writtendate;
	private String modifieddate;
	public GoodsPicture(String picturecode, String filename, String sellcode, String picturepath, String picturetype,
			int priority, String writtendate, String modifieddate) {
		super();
		this.picturecode = picturecode;
		this.filename = filename;
		this.sellcode = sellcode;
		this.picturepath = picturepath;
		this.picturetype = picturetype;
		this.priority = priority;
		this.writtendate = writtendate;
		this.modifieddate = modifieddate;
	}
	public GoodsPicture() {
		super();
	}
	public String getPicturecode() {
		return picturecode;
	}
	public void setPicturecode(String picturecode) {
		this.picturecode = picturecode;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSellcode() {
		return sellcode;
	}
	public void setSellcode(String sellcode) {
		this.sellcode = sellcode;
	}
	public String getPicturepath() {
		return picturepath;
	}
	public void setPicturepath(String picturepath) {
		this.picturepath = picturepath;
	}
	public String getPicturetype() {
		return picturetype;
	}
	public void setPicturetype(String picturetype) {
		this.picturetype = picturetype;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
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
		return "GoodsPicture [picturecode=" + picturecode + ", filename=" + filename + ", sellcode=" + sellcode
				+ ", picturepath=" + picturepath + ", picturetype=" + picturetype + ", priority=" + priority
				+ ", writtendate=" + writtendate + ", modifieddate=" + modifieddate + "]";
	}
		
}
