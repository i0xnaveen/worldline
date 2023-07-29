<%@ page import="java.sql.*" %>
<%
   // Setting up the database connection
   String driver = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/studentform";
   String username = "root";
   String password = "";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, username, password);
      
      // Retrieving data from the database
      stmt = conn.createStatement();
      String sql = "SELECT * FROM details";
      rs = stmt.executeQuery(sql);
      
      // Displaying data in a table
      out.println("<table>");
      out.println("<tr><th>STD NAME</th><th>EMAIL</th><th>REGISTER NO</th><th>DOB</th><th>DEPARTMENT</th><th>GENDER</th><th>AGE</th><th>SEMESTER</th><th>CGPA</th>");
      while(rs.next()) {
       
        
         out.println("<tr>");
         out.println("<td>" + rs.getString("sname") + "</td>");
         out.println("<td>" + rs.getString("email") + "</td>");
         out.println("<td>" + rs.getString("Registerno") + "</td>");
         out.println("<td>" + rs.getString("dob") + "</td>");
         out.println("<td>" + rs.getString("dept") + "</td>");
         out.println("<td>" + rs.getString("gender") + "</td>");
         out.println("<td>" + rs.getString("age") + "</td>");
         out.println("<td>" + rs.getInt("sem") + "</td>");
         out.println("<td>" + rs.getString("cgpa") + "</td>");
        
         out.println("</tr>");
      }
      out.println("</table>");
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if(rs!=null) rs.close();
         if(stmt!=null) stmt.close();
         if(conn!=null) conn.close();
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
%>