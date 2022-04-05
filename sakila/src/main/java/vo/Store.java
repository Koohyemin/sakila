package vo;
public class Store {
	private int storeId;
	private int managerStaffId;
	private int addressId;
	private String lastUpdate;
	
	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", managerStaffId=" + managerStaffId + ", addressId=" + addressId
				+ ", lastUpdate=" + lastUpdate + "]";
	}
	
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public int getManagerStaffId() {
		return managerStaffId;
	}
	public void setManagerStaffId(int managerStaffId) {
		this.managerStaffId = managerStaffId;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
}
