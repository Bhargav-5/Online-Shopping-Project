<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString();
	String prod_id = request.getParameter("id");
	int quantity=1;
	int prod_price=0;
	int prod_total=0;
	int cart_total=0;
	
	int z=0;
	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from product where id='"+prod_id+"'");
		while(rs.next())
		{
			prod_price = rs.getInt(4);
			prod_total = prod_price;
		}
		ResultSet rs1 = st.executeQuery("select * from cart where product_id='"+prod_id+"' and email='"+email+"' and address is NULL");
		while(rs1.next()){
			cart_total = rs1.getInt(5);
			cart_total += prod_total;
			quantity = rs1.getInt(3);
			quantity++;
			z=1;
		}
		if(z==1){
			st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id="+prod_id+" and email='"+email+"' and address is NULL ");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z==0){
			PreparedStatement pstmt = con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
			pstmt.setString(1,email);
			pstmt.setString(2,prod_id);
			pstmt.setInt(3,quantity);
			pstmt.setInt(4,prod_price);
			pstmt.setInt(5,prod_total);
			pstmt.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
		}
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("home.jsp?msg=invalid");
	}
%>