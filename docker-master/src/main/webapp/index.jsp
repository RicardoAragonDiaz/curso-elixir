<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hola war de Camel</title>
    </head>
    <body>
        <%
            String bd_host = System.getenv().get("MYSQL_HOST");
            String bd_base = System.getenv().get("MYSQL_DB");
            String bd_user = System.getenv().get("MYSQL_USER");
            String bd_pass = System.getenv().get("MYSQL_PASSWORD");
            
            //String bd_host = "localhost";
            //String bd_base = "todos";
            //String bd_user = "root";
            //String bd_pass = "";
                    
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://"+ bd_host +"/"+ bd_base + "?user="+bd_user+"&password="+bd_pass);
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM nombres;");
                while (rs.next()) {
                %>
                <h1>Hola <%= rs.getString(2)%></h1>
                <%
                 }
            } catch (Exception e) {
                out.print("error mysql " + e);
            }

        %>
        <h1>Fin</h1>
    </body>
</html>
