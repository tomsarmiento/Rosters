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
	
	//Método que genera un arraylist con la cantidad de jugadores de cada equipo
	public static ArrayList<Integer> getPlayersAmount(){
		ArrayList<Integer> playersAmount = new ArrayList<Integer>();
		for(int i=0; i<Team.getTotalTeams(); i++) {
			if(roster.get(i)!=null) {
				ArrayList<Player> players = roster.get(i);
				Integer playersSize = players.size();
				playersAmount.add(playersSize);
			}
			else {
				Integer zero = 0;
				playersAmount.add(zero);
			}
		}
		return playersAmount;
	}
}
