package kr.ac.kopo.vo;

public class UserInfo {
	private String id;
	private String password;
	private String name;
	private String gender;
	private String email;
	private String phone;
	private String postcode;
	private String homeaddress;
	private String detailaddress;
	private String regdate;
	private int point;
	public UserInfo() {
		super();
	}
	public UserInfo(String id, String password, String name, String gender, String email, String phone, String postcode,
			String homeaddress, String detailaddress, String regdate, int point) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.postcode = postcode;
		this.homeaddress = homeaddress;
		this.detailaddress = detailaddress;
		this.regdate = regdate;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getHomeaddress() {
		return homeaddress;
	}
	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", email="
				+ email + ", phone=" + phone + ", postcode=" + postcode + ", homeaddress=" + homeaddress
				+ ", detailaddress=" + detailaddress + ", regdate=" + regdate + ", point=" + point + "]";
	}
}
