package javaActionForms;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbManager.DbMethods;

/**
 * Servlet implementation class searchTicket
 */
@WebServlet("/userHistory")
public class userHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession	session		=	request.getSession();
		String	ticketNumber	=	(String)session.getAttribute("userName");
		Vector	data			=	DbMethods.searchUserTickets(ticketNumber);
		Vector	data1			=	DbMethods.searchCancelledUserTickets(ticketNumber);
		for(int i	=	0;	i	<	data1.size();	i	++){
			data.add(data1.get(i));
		}
		request.setAttribute("Data", data);
		request.getRequestDispatcher("/jsp/userHistory.jsp").forward(request, response);
	}
}
