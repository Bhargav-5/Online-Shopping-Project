<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
st.executeUpdate("TRUNCATE table cart");
}
catch(Exception e){
System.out.println("Error in logout page");
}
session.invalidate();
response.sendRedirect("login.jsp");

%>