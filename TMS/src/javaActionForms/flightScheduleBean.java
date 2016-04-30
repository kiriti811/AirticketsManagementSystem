package javaActionForms;

public class flightScheduleBean {
	public  int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}


	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}


	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}




	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}


	public int getNodes() {
		return nodes;
	}
	public void setNodes(int nodes) {
		this.nodes = nodes;
	}


	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}


	public String getScheduleDetails() {
		return scheduleDetails;
	}
	public void setScheduleDetails(String scheduleDetails) {
		this.scheduleDetails = scheduleDetails;
	}




	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}




	public int getSeatsAvailable() {
		return seatsAvailable;
	}
	public void setSeatsAvailable(int seatsAvailable) {
		this.seatsAvailable = seatsAvailable;
	}




	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}




	private int id=	0;
	private int cost=	0;
	private int nodes=		0;
	private String flightId	="";
	private String fromDate	="";
	private String toDate	="";
	private String route	="";
	private String time	="";
	private String scheduleDetails	="";
	private int totalSeats	=0;
	private int seatsAvailable	=0;
}
