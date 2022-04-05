package vo;

public class ActorInfo {
	private int actorId;
	private String firstName;
	private String lastName;
	private String filmInfo;
	
	@Override
	public String toString() {
		return "ActorInfo [actorId=" + this.actorId + ", firtstName=" + this.firstName + ", lastName=" + this.lastName + ", filmInfo="
				+ this.filmInfo + "]";
	}
	
	public int getActorId() {
		return actorId;
	}
	public void setActorId(int actorId) {
		this.actorId = actorId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFilmInfo() {
		return filmInfo;
	}
	public void setFilmInfo(String filmInfo) {
		this.filmInfo = filmInfo;
	}
}
