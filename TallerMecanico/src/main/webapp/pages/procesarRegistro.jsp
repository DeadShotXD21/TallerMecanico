<%@ page import="java.sql.*" %>
<%@ page import="Conecta.RenzoConnection" %>
<%
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String clave = request.getParameter("clave");
    String clave2 = request.getParameter("clave2");

    if (!clave.equals(clave2)) {
%>
    <script>
        alert("Las contraseñas no coinciden");
        window.history.back();
    </script>
<%
    } else {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = RenzoConnection.getConnection();
            String query = "INSERT INTO usuarios (nombre, correo, telefono, clave, rol) VALUES (?, ?, ?, ?, 'cliente')";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, nombre);
            stmt.setString(2, correo);
            stmt.setString(3, telefono);
            stmt.setString(4, clave);
            stmt.executeUpdate();
%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        Swal.fire({
            title: '¡Registro Exitoso!',
            text: 'Bienvenido al taller mecánico.',
            icon: 'success',
            confirmButtonText: 'Ir al Inicio'
        }).then(() => {
            window.location.href = 'inicio.jsp';
        });
    </script>
<%
        } catch (Exception e) {
            out.println("<script>alert('Error al registrar: " + e.getMessage() + "'); window.history.back();</script>");
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>
