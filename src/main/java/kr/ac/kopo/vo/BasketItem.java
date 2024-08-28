package kr.ac.kopo.vo;

public class BasketItem {
	private String basketitemcode;
	private String id;
	private String sellcode;
	private int purchasequantity;
	private String writtendate;
	
	public BasketItem(String basketitemcode, String id, String sellcode, int purchasequantity, String writtendate) {
		super();
		this.basketitemcode = basketitemcode;
		this.id = id;
		this.sellcode = sellcode;
		this.purchasequantity = purchasequantity;
		this.writtendate = writtendate;
	}
	public BasketItem() {
		super();
	}
	
	public String getBasketitemcode() {
		return basketitemcode;
	}
	public void setBasketitemcode(String basketitemcode) {
		this.basketitemcode = basketitemcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSellcode() {
		return sellcode;
	}
	public void setSellcode(String sellcode) {
		this.sellcode = sellcode;
	}
	public int getPurchasequantity() {
		return purchasequantity;
	}
	public void setPurchasequantity(int purchasequantity) {
		this.purchasequantity = purchasequantity;
	}
	public String getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}
	@Override
	public String toString() {
		return "BasketItem [id=" + id + ", sellcode=" + sellcode + ", purchasequantity=" + purchasequantity
				+ ", writtendate=" + writtendate + "]";
	}	
}
