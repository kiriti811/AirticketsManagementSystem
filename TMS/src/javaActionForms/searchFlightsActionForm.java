package javaActionForms;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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

public class searchFlightsActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("searchFlightsActionForm.search", "search");
		map.put("searchFlightsActionForm.emptyaction", "emptyaction");
		return map;
	}

	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("search      "+originalFormName);

		Vector	flightDetails	=	DbMethods.searchFlights(request.getParameter("typeOfTrip"),request.getParameter("from"),request.getParameter("to"),request.getParameter("travelDate"));
		if(flightDetails.size()>0){
		int		cost	=	(int) flightDetails.get(flightDetails.size()-1);
		flightDetails.remove(flightDetails.size()-1);
		Vector	flightScheduleId	=	new	Vector();
		for(int i=0;i<flightDetails.size();i++){
			flightScheduleId.add(flightDetails.get(i));
			i=i+7;
		}
		Vector newTravelId	=	removeDuplicate.removeDuplicates(flightScheduleId);
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		for(int i=0;i<newTravelId.size();i++)
		{
			int count	=	0;
			
			List<String> list = new ArrayList<String>();
			
			
			while(count < flightDetails.size()){
				
				if(flightDetails.get(count).equals(newTravelId.get(i))){
					list.add((String) flightDetails.get(count+1));
					list.add((String) flightDetails.get(count+2));
					list.add((String) flightDetails.get(count+3));
					list.add((String) flightDetails.get(count+4));
					list.add((String) flightDetails.get(count+5));
					list.add((String) flightDetails.get(count+6));
					map.put((String) newTravelId.get(i),list);
				}
				
				count	=	count	+	1;	
			}
		}
		request.setAttribute("Data",map);
		request.setAttribute("cost", cost);
		return mapping.findForward("searchSuccess");
		}
		else{
			return mapping.findForward("searchFailure");
					
		}
	
	}
		public ActionForward emptyaction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("emptyaction      "+originalFormName);
		
			return mapping.findForward("emptyactionSuccess");
	}
}
