package kr.ac.kopo.vo;

public class GoodsInfo {
	private String sellcode;
	private String goodsname;
	private String goodscode;
	private String brand;
	private int seasonyear;
	private String season;
	private String gender;
	private int goodsprice;
	private String tag;
	private int stock;
	private String isselling;
	private String writer;
	private String writtendate;
	private String modifier;
	private String modifieddate;
	
	public GoodsInfo() {
		super();
	}
	
	public GoodsInfo(String sellcode, String goodsname, String goodscode, String brand, int seasonyear, String season,
			String gender, int goodsprice, String tag, int stock, String isselling, String writer, String writtendate,
			String modifier, String modifieddate) {
		super();
		this.sellcode = sellcode;
		this.goodsname = goodsname;
		this.goodscode = goodscode;
		this.brand = brand;
		this.seasonyear = seasonyear;
		this.season = season;
		this.gender = gender;
		this.goodsprice = goodsprice;
		this.tag = tag;
		this.stock = stock;
		this.isselling = isselling;
		this.writer = writer;
		this.writtendate = writtendate;
		this.modifier = modifier;
		this.modifieddate = modifieddate;
	}

	public String getSellcode() {
		return sellcode;
	}

	public void setSellcode(String sellcode) {
		this.sellcode = sellcode;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getGoodscode() {
		return goodscode;
	}

	public void setGoodscode(String goodscode) {
		this.goodscode = goodscode;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getGoodsprice() {
		return goodsprice;
	}

	public void setGoodsprice(int goodsprice) {
		this.goodsprice = goodsprice;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getIsselling() {
		return isselling;
	}

	public void setIsselling(String isselling) {
		this.isselling = isselling;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getModifieddate() {
		return modifieddate;
	}

	public void setModifieddate(String modifieddate) {
		this.modifieddate = modifieddate;
	}

	@Override
	public String toString() {
		return "GoodsInfo [sellcode=" + sellcode + ", goodsname=" + goodsname + ", goodscode=" + goodscode + ", brand="
				+ brand + ", seasonyear=" + seasonyear + ", season=" + season + ", gender=" + gender + ", goodsprice="
				+ goodsprice + ", tag=" + tag + ", stock=" + stock + ", isselling=" + isselling + ", writer=" + writer
				+ ", writtendate=" + writtendate + ", modifier=" + modifier + ", modifieddate=" + modifieddate + "]";
	}

	
}
