package tomassarmiento.web.models;

public class Team {
	private static int totalTeams = 0;
	private String name;
	
	public Team() {
		name= "Unknown";
	}
	public Team(String name) {
		this.name = name;
		totalTeams++;
	}
	
	//getters and setters
	public static int getTotalTeams() {
		return totalTeams;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name= name;
	}
}
