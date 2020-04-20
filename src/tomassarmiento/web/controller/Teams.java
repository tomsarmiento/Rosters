package tomassarmiento.web.controller;

import java.io.IOException;
import java.util.ArrayList;
//import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tomassarmiento.web.models.Player;
import tomassarmiento.web.models.Roster;
//import tomassarmiento.web.models.Roster;
import tomassarmiento.web.models.Team;
/**
 * Servlet implementation class Teams
 */
@WebServlet("/Teams")
public class Teams extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Teams() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	HttpSession session = request.getSession();
	if(request.getParameter("toDeleteId")!=null) {//Viene de index a borrar un equipo
		int toDeleteId = Integer.parseInt(request.getParameter("toDeleteId"));
		Roster.deleteTeam(toDeleteId);
		
		@SuppressWarnings("unchecked")
		ArrayList<String> newNames = (ArrayList<String>) session.getAttribute("names");
		newNames.remove(toDeleteId);
		session.setAttribute("names", newNames);
		
		response.sendRedirect("Home");
	}
	else {// Viene de index a ver los detalles de alg�n team en particular
		if(request.getParameter("id")!=null) {
			//Almaceno la ID en la session para saber que team est� siendo consultado
			int teamId = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("id",teamId);                  
			System.out.println("id parameter no es null :"+session.getAttribute("id"));
			
			if(Roster.getRoster().get(teamId)==null) {
				//Creo el arraylist de los players de inmediato para evitar problemas al desplegar los nombres de los players
				//de este team con id=teamId
				ArrayList<Player> players = new ArrayList<Player>();
				//agrego el arraylist al hashmap con su respectivo id como key
				Roster.setRoster(teamId, players);
				//a�ado el arraylist con los players en session attribute "players"
				session.setAttribute("players", Roster.getRoster().get(teamId));
				System.out.println("Teamid attribute es null");		
			}
			else {
				// establezco el arraylist de los jugadores de este team con id=teamId en el atributo "players" de sesi�n
				session.setAttribute("players", Roster.getRoster().get(teamId));		
				System.out.println("Teamid attribute no es null");
			}
		}
		
		// Redirecciona para ver los detalles del team 
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/TeamInfo.jsp");
		view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		//Verifica si viene de Index o de NewTeam
		if(request.getParameter("name")==null) { // Viene de index
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/NewTeam.jsp"); 
		    view.forward(request, response);

			System.out.println("name parameter es null");

		}
		else{ // Viene de NewTeam
			Team team = new Team(request.getParameter("name"));
			//Se van agregando los nombres de cada team a medida que se van creando
			//Este ArrayList es especificamente para mostrar el nombre de cada team en los JSP
			ArrayList<String> newNames = (ArrayList<String>) session.getAttribute("names");
			newNames.add(team.getName());
			session.setAttribute("names", newNames);
			
			//Para llevar una cuenta total de los teams creados
			int totalTeams = Team.getTotalTeams(); //* cambi� team por Team pues el m�todo ahora es static
			session.setAttribute("totalTeams", totalTeams);
			
			//Para mostrar la cantidad de jugadores de cada equipo
			ArrayList<Integer> playersAmount = Roster.getPlayersAmount();
			session.setAttribute("playersAmount", playersAmount);
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			view.forward(request, response);
			System.out.println("name parameter no es null");
		}
		if(session.getAttribute("names")==null) {
			//ArrayList para los nombres de cada team
			ArrayList<String> names = new ArrayList<String>();
			session.setAttribute("names", names);
			System.out.println("names attribute es null");
		}
	}

}
