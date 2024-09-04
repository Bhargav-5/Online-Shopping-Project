<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<%
	String id = request.getParameter("id");	
	String name = request.getParameter("name");
	String cate = request.getParameter("category");
	String pric = request.getParameter("price");
	String stat = request.getParameter("active");

	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from product where id='"+id+"'");
		
		st.executeUpdate("update product set name='"+name+"',category='"+cate+"',price='"+pric+"',active='"+stat+"' where id='"+id+"' ");
		if(stat.equals("No")){
			st.executeUpdate("delete from cart where id='"+id+"' and address is NULL");
		}
		response.sendRedirect("allProductEditProduct.jsp?msg=done");
		
		
	}
	catch(Exception e){
		
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	}
	
%>