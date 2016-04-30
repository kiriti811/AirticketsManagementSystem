package javaActionForms;

public class routeBean {
	public  int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	




	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}








	public int getNodes() {
		return nodes;
	}
	public void setNodes(int nodes) {
		this.nodes = nodes;
	}





	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}





	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}





	private int id=	0;
	private String routeId	="";
	private String location	="";
	private String route	="";
	private int nodes=	0;
}
