<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Conectar;encrypt=false", "sa", "DeadShot2104");

        String sql = "SELECT id, nombre FROM mecanicos";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String nombre = rs.getString("nombre");
%>
<option value="<%=id%>"><%=nombre%></option>
<%
        }
    } catch (Exception e) {
        out.println("<option>Error al cargar mecánicos</option>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
