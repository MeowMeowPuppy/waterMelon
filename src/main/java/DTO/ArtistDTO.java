package DTO;

public class ArtistDTO {
	private String gender; // 혼성, 여성, 남성 구분
	private String team; // 솔로, 듀오, 그룹 구분
	private String name; // 아티스트의 이름
	private String member; // 그룹에 속한 가수 이름
	/*
	 * 아티스트의 이름의 예제 악동뮤지션의 예제 ex) 
	 * AKMU-악뮤-악동 뮤지션 포함된 키워드가 하이픈을 기준으로 모두 들어가도록 저장
	 * 
	 * 그룹에 속한 가수 이름 약동뮤지션 예제 ex)
	 * 이찬혁-이수현
	 * 팀의 멤버 이름을 하이픈 기준으로 구분지어서 저장
	 */

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

}