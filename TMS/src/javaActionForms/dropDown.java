package javaActionForms;

import java.util.Vector;

import DbManager.DbMethods;

public class dropDown {
	public static Vector dropDown(String str)
	{
		Vector dropDownVector	=	new Vector();
		if(str=="flightId")
		{
			dropDownVector	= DbMethods.dropDown(str,"flightDetails");
		}
		else if(str=="location")
		{
			dropDownVector	=	DbMethods.dropDown(str,"airportDetails");
		}
		else if(str=="route")
		{
			dropDownVector	=	DbMethods.dropDown(str,"route");
		}
		else if(str=="typeOfTrip")
		{
			dropDownVector	= DbMethods.dropDown(str,"tripType");
		}
		return	dropDownVector;
	}
	public static String dropDownReference(String ReferenceId,String formName)
	{
		String dropDownReferenceVector	=	"";
		if(formName.equals("flightSchedule"))
		{
			dropDownReferenceVector	=	DbMethods.dropDownReference(ReferenceId,"FLIGHTID","FLIGHTDETAILS");
		}
		else if(formName.equals("airportDetails"))
		{
			dropDownReferenceVector	=	DbMethods.dropDownReference(ReferenceId,"LOCATION","AIRPORTDETAILS");

		}
		return dropDownReferenceVector;
	}

}
