package tomassarmiento.web.models;

import java.util.ArrayList;
import java.util.HashMap;

public class Roster {
	//Hashmap que contiene los players de cada team con su ID como key 
	static HashMap<Integer, ArrayList<Player>> roster = new HashMap<Integer, ArrayList<Player>>();
	
	public Roster(Integer id, ArrayList<Player> players) {
		roster.put(id, players);
	}
	
	public static void setRoster(Integer id, ArrayList<Player> players) {
		roster.put(id, players);
	}
	public static HashMap<Integer, ArrayList<Player>> getRoster(){
		return roster;
	}
}
