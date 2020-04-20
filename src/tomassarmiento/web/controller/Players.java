package tomassarmiento.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tomassarmiento.web.models.Player;
import tomassarmiento.web.models.Roster;

/**
 * Servlet implementation class Players
 */
@WebServlet("/Players")
public class Players extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Players() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("playerId")!=null) { 
			//Viene de teaminfo a borrar un jugador
			HttpSession session = request.getSession();
			int playerId = Integer.parseInt(request.getParameter("playerId"));
			int teamId = (Integer) session.getAttribute("id");
			
			@SuppressWarnings("unchecked")
			ArrayList<Player> playersErase = (ArrayList<Player>) session.getAttribute("players");
			playersErase.remove(playerId);
			Roster.setRoster(teamId, playersErase);
			session.setAttribute("players", playersErase);
			response.sendRedirect("Teams?id="+teamId+"");
		}
		else {
			//Viene de teamInfo a crear un nuevo jugador
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/NewPlayer.jsp");
			view.forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		// Creando las variables con los datos del jugador para clarificar el código
		String playerName = request.getParameter("name");
		String playerLastName = request.getParameter("apellido");
		Integer playerAge = Integer.parseInt(request.getParameter("age"));
		int teamId = (Integer) session.getAttribute("id");
		
		// Creando el jugador 
		Player player = new Player(playerName, playerLastName, playerAge);
		if(Roster.getRoster().get(teamId)==null) {
			ArrayList<Player> players = new ArrayList<Player>();
			players.add(player);
			//agrego el arraylist al hashmap con su respectivo id como key
			Roster.setRoster(teamId, players);
			//session.setAttribute("hashmapPlayers", Roster.getRoster());
			session.setAttribute("players", Roster.getRoster().get(teamId));
		}
		else {
			// guardar todo en Roster
			ArrayList<Player> newPlayers = (Roster.getRoster()).get(teamId);
			newPlayers.add(player);
			Roster.setRoster(teamId, newPlayers);
			session.setAttribute("players", Roster.getRoster().get(teamId));
		}
		
		response.sendRedirect("Teams?id="+teamId+"");
	}

}
