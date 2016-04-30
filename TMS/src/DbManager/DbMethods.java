package DbManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;


public class DbMethods {
	static DbConnection db = new DbConnection();
	static Statement st = null;
	static ResultSet res = null;
	public static void changePassword(String userName, String password) {
		// TODO Auto-generated method stub
		try {

		st = db.getConnection().createStatement();
		st.executeQuery("update userprofiles set password='"+password+"',confirmpassword='"+password+"' where username='"+userName+"'");
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String addUserProfiles(Vector columns, String formName) {
		// TODO Auto-generated method stub
		String patid = "user";
		int id = 0;
		try {

			Statement st1 = null;
			ResultSet res1 = null;
			st1 = db.getConnection().createStatement();
			res1 = st1
					.executeQuery("select userprofiles_seq.nextval from dual");
			while (res1.next()) {
				id = res1.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		patid = patid + id;
		String query = "Insert into userprofiles values(" + id + ",'" + patid
				+ "',";
		for (int i = 2; i < columns.size(); i++) {
			query = query + "'" + columns.get(i) + "',";
		}
		query = query.substring(0, query.length() - 1) + ",'customer')";
		try {
			st = db.getConnection().createStatement();
			st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return patid;
	}

	
	public static String authenticate(String userName, String password, String userType) {
		String authStatus = "Fail$$$";
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select password,id from userprofiles where username='"
					+ userName + "' and userType='"+ userType +"'");
			while (res.next()) {
				if (password.equals(res.getString(1))) {
					authStatus = "Success$$$"+res.getString(2);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return authStatus;
	}
	public static void add(Vector columns, String formName) {
		// TODO Auto-generated method stub
		String query	="Insert into "+formName+" "
				+ "values("+formName+"_seq.nextval,";
		for(int	i	=	1	;	i	<	columns.size();	i++)
		{
			query	=	query	+	"'"	+columns.get(i)+"',";
		}
		query	=	query.substring(0,query.length()-1)	+	")";
		try {
			st	=	db.getConnection().createStatement();
			st.executeQuery(query);
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	public static int flightScheduleSeq(String formName){
		int 	fs	=	0;
		try {
			st	=	db.getConnection().createStatement();
			String query	=	"select "+formName+"_seq.nextval from dual";
			res	=	st.executeQuery(query);
			while(res.next()){
				fs	=	res.getInt(1);
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return	fs;
	}
	public static void addFlights(Vector columns, String formName,Vector childData,String travelDate) {
		// TODO Auto-generated method stub
		int	Fs	= flightScheduleSeq(formName);
		String query	="Insert into "+formName+" "
				+ "values("+Fs+",";
		for(int	i	=	1	;	i	<	columns.size();	i++)
		{
			query	=	query	+	"'"	+columns.get(i)+"',";
		}
		String	Fsnumber	=	
		query	=	query.substring(0,query.length()-1)	+",'Fs"+Fs+"','"+travelDate+"')";
		try {
			st	=	db.getConnection().createStatement();
			st.executeQuery(query);
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		for(int	i	=	0;	i	<	childData.size();	i++){
		String query1	=	"insert into settimings values(settimings_seq.nextval,'Fs"+Fs+"','"+childData.get(i)+"','"+childData.get(i+1)+"','"+childData.get(i+2)+"','"+childData.get(i+3)+"','"+childData.get(i+4)+"','"+childData.get(i+5)+"','"+childData.get(i+6)+"')";	
		try {
			st.executeQuery(query1);
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		i	=	i	+	6;
		}
	}
	public static int listColumnCount(String formName) {
		// TODO Auto-generated method stub
		int columnCount	=	0;
		try {
			st	=	db.getConnection().createStatement();
			res = st.executeQuery("select COUNT(*) from dba_tab_columns where table_name = '"+formName+"'");
			while(res.next()){
				columnCount	=	res.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return columnCount;
	}
	public static Vector listColumns(String formName,int columnCount) {
		Vector vec	=	new	Vector();
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select column_name from dba_tab_columns where table_name = '"+formName+"'");
		while(res.next()){
			vec.add(res.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	public static Vector listRows(String formName,int columnCount) {
		// TODO Auto-generated method stub
		Vector	vec	=	new	Vector();
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("select * from "+formName+" order by id");
			while(res.next()){
				for(int i	=	0;	i	<	columnCount;	i++){
				vec.add(res.getString(i+1));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
		}
	public static void edit(Vector variables,Vector values, String formName, int id) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		String query	="Update "+formName+" set ";
		for(int	i	=	0	;	i	<	values.size();	i++)
		{
			if(i==0)
			{
				query	=	query+variables.get(i)	+ "="	+values.get(i)+",";
			}
			else{
				query	=	query+variables.get(i)	+ "='"	+values.get(i)+"',";
			}
		}
		query	=	query.substring(0,query.length()-1)+ " where id="+id;
		try {
			st	=	db.getConnection().createStatement();
			st.executeQuery(query);
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	public static Vector listEdit(int id, String formName,int columnCount) {
		// TODO Auto-generated method stub
		Vector	vec	=	new	Vector();
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("select * from "+formName+" where id="+id);
			while(res.next()){
				for(int i	=	0;	i	<	columnCount;	i++){
					vec.add(res.getString(i+1));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	public static Vector dropDown(String columnName,String tableName) {
		Vector vec	=	new	Vector();
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select id,"+columnName+" from  "+tableName+"");
		
		while(res.next()){
			vec.add(res.getInt(1));
			vec.add(res.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
		// TODO Auto-generated method stub
		
	}
	public static String dropDownReference(String referenceId,String columnName,String tableName) {
		String str	=	"";
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select "+columnName+" from  "+tableName+" where id="+referenceId);
		while(res.next()){
			str=res.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
		// TODO Auto-generated method stub
		
	}

	public static Vector getAwarededBids(String userName) {
		// TODO Auto-generated method stub
		Vector vec	=	new	Vector();
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select username,projectName,bidamount from  userBids where status='awarded' and username='"+userName+"'");
		while(res.next()){
			Statement st1 = null;
			ResultSet res1 = null;
			st1	=	db.getConnection().createStatement();
			res1=	st1.executeQuery("select projectName from manageProject where id="+res.getString(2));
			vec.add(res.getString(1));
			while(res1.next()){
				vec.add(res1.getString(1));
			}
			vec.add(res.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	
	public static Vector getLocation() {
		Vector 	vec =	new Vector();
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select location from  airportdetails");
		while(res.next()){
			vec.add(res.getString(1));			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	public static Vector searchFlights(String typeOfTrip, String from,
			String to, String travelDate) {
		// TODO Auto-generated method stub
		Vector	flightDetails	=	new	Vector();	 
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select * from  flightschedule where traveldate='"+travelDate+"'");
		while(res.next()){
			String route	=	res.getString(2);
			if(from.equals(route.substring(1,route.length()).substring(0,route.substring(1,route.length()).indexOf("-")))    &&      to.equals(route.substring(route.lastIndexOf("-")+1,route.length())))
			{
				if(res.getInt(5)>0){
					Statement st1 = null;
					ResultSet res1 = null;
					int	cost	=	res.getInt(5);
					st1	=	db.getConnection().createStatement();
					res1=	st1.executeQuery("select * from setTimings where flightscheduleid='"+res.getString(7)+"'");
					while(res1.next()){
						flightDetails.add(res1.getString(2));
						flightDetails.add(res1.getString(3));
						flightDetails.add(res1.getString(4));
						flightDetails.add(res1.getString(5));
						flightDetails.add(res1.getString(6));
						flightDetails.add(res1.getString(7));
						flightDetails.add(res1.getString(8));
						flightDetails.add(res1.getString(9));
					}
					flightDetails.add(res.getInt(6));
					
				}
			}
		}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return	flightDetails;
		}
	public static Vector retriveFlightScheduleID() {
		// TODO Auto-generated method stub
		Vector flightScheduleID	=	new Vector();
		try{
		st	=	db.getConnection().createStatement();
		res=	st.executeQuery("select flightscheduleid from setTimings");
		while(res.next()){
			flightScheduleID.add(res.getString(2));
		}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return flightScheduleID;
	}
	
	
	public static int customerDetailsSeq(String formName){
		int 	fs	=	0;
		try {
			st	=	db.getConnection().createStatement();
			String query	=	"select "+formName+"_seq.nextval from dual";
			res	=	st.executeQuery(query);
			while(res.next()){
				fs	=	res.getInt(1);
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return	fs;
	}
	public static int TicketSeq(String formName){
		int 	fs	=	0;
		try {
			st	=	db.getConnection().createStatement();
			String query	=	"select "+formName+"_seq.nextval from dual";
			res	=	st.executeQuery(query);
			while(res.next()){
				fs	=	res.getInt(1);
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return	fs;
	}
	public static String addCustomers(Vector childData, String fsCode,String date, String userName) {
		// TODO Auto-generated method stub
		String str	="";
		int count	=	0;
		int	ticket_seq	=	TicketSeq("ticket");
		for(int	i	=	0;	i	<	childData.size();	i++){
			int	Fs	= customerDetailsSeq("customerDetails");
			str	=	"TMS"+ticket_seq;
			String query1	=	"insert into customerDetails values("+Fs+",'"+fsCode+"','"+childData.get(i)+"','"+childData.get(i+1)+"','"+childData.get(i+2)+"','"+childData.get(i+3)+"','"+str+"','"+childData.get(i+4)+"','"+date+"','"+userName+"')";	
			try {
			st.executeQuery(query1);
			} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
			count	=	count	+	1;
		i	=	i	+	4;
		}
		String	query2	="update flightschedule set seatsavailable=(select seatsavailable from flightschedule where flightscheduleid='"+fsCode+"')-"+count+" where flightscheduleid='"+fsCode+"'";
		try {
			st.executeUpdate(query2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return	str;
	}
	public static Vector getTicket(String ticketCode) {
		Vector	ticketDetails	=	new	Vector();
		Vector	routeDetails	=	new	Vector();
		ticketDetails.add(ticketCode);
		Vector	totalDetails	=	new	Vector();
		String flighscheduleid	=	"";
		// TODO Auto-generated method stub
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("select fullname,cost,flightscheduleid from customerdetails where ticketnumber='"+ticketCode+"'");
			while(res.next()){
					ticketDetails.add(res.getString(1));
					ticketDetails.add(res.getString(2));
					flighscheduleid	=	res.getString(3);
					}
			res	=	st.executeQuery("select * from settimings where flightscheduleid='"+flighscheduleid+"'");
			while(res.next()){
					routeDetails.add(res.getString(3));
					routeDetails.add(res.getString(4));
					routeDetails.add(res.getString(5));
					routeDetails.add(res.getString(6));
					routeDetails.add(res.getString(7));
					routeDetails.add(res.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		totalDetails.add(ticketDetails);
		totalDetails.add(routeDetails);
		return	totalDetails;
	}
	public static Vector searchTickets(String ticketNumber) {
		// TODO Auto-generated method stub
		Vector	ticketDetails	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(ticketNumber.equals(temp1))
			{
				query	=	"select * from customerdetails order by id";
			}
			else if (!ticketNumber.equals(temp1)) {
				query	=	"select * from customerdetails where ticketnumber='"+ticketNumber+"' order by id";
			}
			String	temp2	=	"";
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			while(res.next()){
				if(!temp2.equals(res.getString(7))){
					ticketDetails.add(res.getString(7));
					ticketDetails.add(res.getString(9));
					ticketDetails.add(res.getString(10));
					temp2	=	res.getString(7);
				}
			}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ticketDetails;
	}
	public static Vector searchUserTickets(String ticketNumber) {
		// TODO Auto-generated method stub
		Vector	ticketDetails	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(ticketNumber.equals(temp1))
			{
				query	=	"select * from customerdetails order by id";
			}
			else if (!ticketNumber.equals(temp1)) {
				query	=	"select * from customerdetails where username='"+ticketNumber+"' order by id";
			}
			String	temp2	=	"";
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			while(res.next()){
				if(!temp2.equals(res.getString(7))){
					ticketDetails.add(res.getString(7));
					ticketDetails.add(res.getString(9));
					ticketDetails.add(res.getString(10));
					ticketDetails.add("Booked");
					temp2	=	res.getString(7);
				}
			}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ticketDetails;
	}
	public static Vector searchCancelledUserTickets(String ticketNumber) {
		// TODO Auto-generated method stub
		Vector	ticketDetails	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(ticketNumber.equals(temp1))
			{
				query	=	"select * from cancelcustomerdetails order by id";
			}
			else if (!ticketNumber.equals(temp1)) {
				query	=	"select * from cancelcustomerdetails where username='"+ticketNumber+"' order by id";
			}
			System.out.println(query);
			String	temp2	=	"";
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			while(res.next()){
				if(!temp2.equals(res.getString(7))){
					ticketDetails.add(res.getString(7));
					ticketDetails.add(res.getString(9));
					ticketDetails.add(res.getString(10));
					ticketDetails.add("Cancel");
					temp2	=	res.getString(7);
				}
			}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		System.out.println(ticketDetails);
			return ticketDetails;
	}
	public static Vector getDailyReport(String date) {
		// TODO Auto-generated method stub
		Vector	dailyReport	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(date.equals(temp1))
			{
				query	=	"select * from customerdetails order by id";
			}
			else if (!date.equals(temp1)) {
				query	=	"select * from customerdetails where bookeddate='"+date+"' order by id";
			}
			int	temp2	=	0;
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			int 	count	=	0;
			while(res.next()){
				dailyReport.add(res.getString(7));
				dailyReport.add(res.getString(8));
			}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return dailyReport;
	}
	public static Vector getYearlyReport(String date) {
		// TODO Auto-generated method stub
		Vector	dailyReport	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(date.equals(temp1))
			{
				query	=	"select * from customerdetails order by id";
			}
			else if (!date.equals(temp1)) {
				query	=	"select * from customerdetails where bookeddate like '%"+date+"%' order by id";
			}
			int	temp2	=	0;
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			int 	count	=	0;
			while(res.next()){
				dailyReport.add(res.getString(7));
				dailyReport.add(res.getString(8));
			}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return dailyReport;
	}

	public static void cancelTicket(String ticketCode,String CancelDate) {
		// TODO Auto-generated method stub
		Vector	ticketDetails	=	new	Vector();
		Vector	routeDetails	=	new	Vector();
		Vector	totalDetails	=	new	Vector();
		String flighscheduleid	=	"";
		// TODO Auto-generated method stub
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("select * from customerdetails where ticketnumber='"+ticketCode+"'");
			while(res.next()){
					ticketDetails.add(res.getString(2));
					ticketDetails.add(res.getString(3));
					ticketDetails.add(res.getString(4));
					ticketDetails.add(res.getString(5));
					ticketDetails.add(res.getString(6));
					ticketDetails.add(res.getString(7));
					ticketDetails.add(res.getString(8));
					ticketDetails.add(res.getString(9));
					ticketDetails.add(res.getString(10));
					}
			for(int	i	=	0;	i	<	ticketDetails.size()/9	;	i++)
			{
				st.executeUpdate("insert into cancelcustomerdetails values(cancelcustomerdetails_seq.nextval,'"+ticketDetails.get(i+0)+"','"+ticketDetails.get(i+1)+"','"+ticketDetails.get(i+2)+"','"+ticketDetails.get(i+3)+"','"+ticketDetails.get(i+4)+"','"+ticketDetails.get(i+5)+"','"+ticketDetails.get(i+6)+"','"+ticketDetails.get(i+7)+"','"+ticketDetails.get(i+8)+"','"+CancelDate+"')");
				i	=	i	+	1;
			}
			st.executeUpdate("Delete from customerdetails where ticketnumber='"+ticketCode+"'");
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}