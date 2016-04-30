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

public class customerDetailsActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("customerDetailsActionForm.add", "add");
		return map;
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("add      "+originalFormName);

		
		Vector vec	=	new	Vector();
		int	count	=	0;    
		Enumeration en=request.getParameterNames();
		String	fsCode	=	"";
		while(en.hasMoreElements())
		{
			Object objOri=en.nextElement();
			String param=(String)objOri;
			String value=request.getParameter(param);
			if(count>1)
	    	{
		    	vec.add(value);
		 	}
			else if(count==1)
	    	{
		    	fsCode	=	value;
		 	}
	    	count	=	count	+	1;
	     }
		String date	=	(String)vec.get(vec.size()-1);
		vec.remove(vec.size()-1);
		HttpSession	session	=	request.getSession();
		String	userName	=	(String)session.getAttribute("userName");
		String	ticketCode	=	DbMethods.addCustomers(vec,fsCode,date,userName);
		request.setAttribute("ticketCode", ticketCode);
		
		return mapping.findForward("addSuccess");
	}
	
	
}
