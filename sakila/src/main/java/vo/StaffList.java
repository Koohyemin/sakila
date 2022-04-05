package vo;
public class StaffList {
	private int id;
	private String name;
	private String address;
	private String zipCode;
	private String phone;
	private String city;
	private String country;
	private int sid;
	
	@Override
	public String toString() {
		return "StaffList [id=" + this.id + ", name=" + this.name + ", address=" + this.address + ", zipCode=" + this.zipCode + ", phone="
				+ this.phone + ", city=" + this.city + ", country=" + this.country + ", sid=" + this.sid + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}
}
