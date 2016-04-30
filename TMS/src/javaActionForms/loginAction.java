package javaActionForms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbManager.*;;

/**
 * Servlet implementation class loginForm
 */
@WebServlet("/loginAction")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName		=	request.getParameter("username");
		String password		=	request.getParameter("password");
		String userType		=	request.getParameter("userType");
		String authStatus	=	DbMethods.authenticate(userName, password, userType);
		String id	=	authStatus.substring(authStatus.indexOf("$$$")+3,authStatus.length());
		HttpSession	session	=	request.getSession();
		session.setAttribute("id", id);
		authStatus	=	authStatus.substring(0,authStatus.indexOf("$$$"));

		if(authStatus.equals("Success")){
		
			session.setAttribute("userName", userName);
			if(userName.equals("admin")){
				request.getRequestDispatcher("/jsp/Home.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/jsp/Home.jsp").forward(request, response);
			}
		}
		else{
			request.setAttribute("message", "Please Provide The Correct UserName And Password");
			request.getRequestDispatcher("/jsp/LoginPage.jsp?userType=customer").forward(request, response);
		}
	}

}
