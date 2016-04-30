package javaActionForms;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.LookupDispatchAction;

import DbManager.DbMethods;

public class bookConfirmationActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("bookConfirmationActionForm.book", "book");
		map.put("bookConfirmationActionForm.ticketDetails", "ticketDetails");
		return map;
	}

	public ActionForward book(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("book      "+originalFormName);

		
		String fsCode			=	request.getParameter("fscode");
		String noOfPassengers	=	request.getParameter("no");
		request.setAttribute("fsCode", fsCode);
		request.setAttribute("noOfPassengers", noOfPassengers);
		return mapping.findForward("bookSuccess");
	}
	
	public ActionForward ticketDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("ticketDetails      "+originalFormName);

		request.getParameter("fscode");
		return null;
	}

}
