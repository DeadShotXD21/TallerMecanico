<%@ page import="java.sql.*" %>
<%@ page import="Conecta.RenzoConnection" %>
<%
    String email = request.getParameter("email");
    String clave = request.getParameter("clave");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    boolean loginExitoso = false;
    String rol = null;

    try {
        conn = RenzoConnection.getConnection();

        // Consulta para verificar el usuario
        String query = "SELECT u.*, r.nombre AS rol FROM usuarios u INNER JOIN roles r ON u.rol_id = r.id WHERE u.correo = ? AND u.clave = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, email);
        stmt.setString(2, clave);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // Si el usuario existe y las credenciales son correctas
            loginExitoso = true;
            rol = rs.getString("rol"); // Obtener el rol del usuario
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    // Enviar respuesta en formato JSON
    response.setContentType("application/json");
    if (loginExitoso) {
        out.println("{\"success\": true, \"rol\": \"" + rol + "\"}");
    } else {
        out.println("{\"success\": false}");
    }
%>