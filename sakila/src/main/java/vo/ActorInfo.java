package vo;

public class ActorInfo {
	private int actorId;
	private String firtstName;
	private String lastName;
	private String filmInfo;
	
	@Override
	public String toString() {
		return "ActorInfo [actorId=" + actorId + ", firtstName=" + firtstName + ", lastName=" + lastName + ", filmInfo="
				+ filmInfo + "]";
	}
	
	public int getActorId() {
		return actorId;
	}
	public void setActorId(int actorId) {
		this.actorId = actorId;
	}
	public String getFirtstName() {
		return firtstName;
	}
	public void setFirtstName(String firtstName) {
		this.firtstName = firtstName;
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
