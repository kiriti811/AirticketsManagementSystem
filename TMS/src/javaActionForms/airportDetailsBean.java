package javaActionForms;

public class airportDetailsBean {
	public  int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	


	public String getAirportName() {
		return airportName;
	}
	public void setAirportName(String airportName) {
		this.airportName = airportName;
	}



	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}



	public String getAirportCode() {
		return airportCode;
	}
	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}



	private int id=	0;
	private String airportName	="";
	private String location	="";
	private String airportCode	="";
}
