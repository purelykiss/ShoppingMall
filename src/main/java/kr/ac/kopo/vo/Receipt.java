package kr.ac.kopo.vo;

public class Receipt {
	private String purchasecode;
	private String id;
	private String sellcode;
	private int purchaseprice;
	private int purchasequantity;
	private String isrefund;
	private String purchasedate;
	private String modifier;
	private String modifieddate;
	public Receipt() {
		super();
	}
	public Receipt(String purchasecode, String id, String sellcode, int purchaseprice, int purchasequantity,
			String isrefund, String purchasedate, String modifier, String modifieddate) {
		super();
		this.purchasecode = purchasecode;
		this.id = id;
		this.sellcode = sellcode;
		this.purchaseprice = purchaseprice;
		this.purchasequantity = purchasequantity;
		this.isrefund = isrefund;
		this.purchasedate = purchasedate;
		this.modifier = modifier;
		this.modifieddate = modifieddate;
	}
	public String getPurchasecode() {
		return purchasecode;
	}
	public void setPurchasecode(String purchasecode) {
		this.purchasecode = purchasecode;
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
	public int getPurchaseprice() {
		return purchaseprice;
	}
	public void setPurchaseprice(int purchaseprice) {
		this.purchaseprice = purchaseprice;
	}
	public int getPurchasequantity() {
		return purchasequantity;
	}
	public void setPurchasequantity(int purchasequantity) {
		this.purchasequantity = purchasequantity;
	}
	public String getIsrefund() {
		return isrefund;
	}
	public void setIsrefund(String isrefund) {
		this.isrefund = isrefund;
	}
	public String getPurchasedate() {
		return purchasedate;
	}
	public void setPurchasedate(String purchasedate) {
		this.purchasedate = purchasedate;
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
}
