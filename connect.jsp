<%@ page import="java.sql.*" %>
<%
String sname = request.getParameter("sname");
String email = request.getParameter("email");
String RegisterNo = request.getParameter("RegisterNo"); // Corrected variable name
String dob = request.getParameter("dob");
String dept = request.getParameter("dept");
String gender = request.getParameter("gender");
String age = request.getParameter("age");
String sem = request.getParameter("sem");
String cgpa = request.getParameter("cgpa");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentform", "root", "");
    PreparedStatement ps = conn.prepareStatement("INSERT INTO details(sname, email, Registerno, dob, dept, gender, age, sem, cgpa) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, sname);
    ps.setString(2, email);
    ps.setString(3, RegisterNo);
    ps.setString(4, dob);
    ps.setString(5, dept);
    ps.setString(6, gender);
    ps.setString(7, age);
    ps.setString(8, sem);
    ps.setString(9, cgpa);

    int x = ps.executeUpdate();

    if (x > 0) {
        out.println("Registration Successful...");
    } else {
        out.println("Registration Unsuccessful....");
    }

} catch (Exception e) {
    out.println(e);
}
%>
