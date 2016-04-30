package javaActionForms;

public class flightDetailsBean {
	public  int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMakeType() {
		return makeType;
	}
	public void setMakeType(String makeType) {
		this.makeType = makeType;
	}

	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}

	public String getMakeYear() {
		return makeYear;
	}
	public void setMakeYear(String makeYear) {
		this.makeYear = makeYear;
	}

	private int id=	0;
	private String flightId	="";
	private String makeType	="";
	private String makeYear	="";
}
