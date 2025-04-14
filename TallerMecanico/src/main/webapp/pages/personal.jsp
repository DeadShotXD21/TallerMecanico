<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Personal</title>
    <link rel="stylesheet" href="../css/estilos.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>

    <section id="gestion-personal">
        <h2>Gestión de Personal</h2>

        <!-- Asignación de tareas a mecánicos -->
        <div id="asignacion-tareas">
            <h3>Asignar Tarea a Mecánico</h3>
            <form action="asignarTarea.jsp" method="post">
                <label for="mecanico">Seleccionar Mecánico:</label>
                <select id="mecanico" name="mecanico">
   	 			<option value="">-- Seleccione --</option>
    			<option value="1">Carlos López</option>
    			<option value="2">Ana Torres</option>
    			<option value="3">Luis Ramírez</option>
    			<option value="4">María González</option>
				</select>
                    <% 
                        // Conexión a la base de datos
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            // Establecer conexión a la base de datos
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taller", "usuario", "contraseña");
                            stmt = conn.createStatement();
                            String sql = "SELECT id, nombre FROM mecanicos";
                            rs = stmt.executeQuery(sql);

                            // Llenar los mecánicos en el select
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nombre = rs.getString("nombre");
                    %>
                    <option value="<%= id %>"><%= nombre %></option>
                    <% 
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException se) {
                                se.printStackTrace();
                            }
                        }
                    %>
                </select>

                <label for="tarea">Seleccionar Tarea:</label>
                <select id="tarea" name="tarea">
                    <option value="mantenimiento">Mantenimiento Preventivo</option>
                    <option value="reparacion">Reparación de Motor</option>
                    <option value="cambioAceite">Cambio de Aceite</option>
                    <option value="neumaticos">Reemplazo de Neumáticos</option>
                    <option value="frenos">Frenos</option>
                </select>
                
                <label for="tiempo">Tiempo Estimado (en horas):</label>
                <input type="number" id="tiempo" name="tiempo" min="1" required>

                <input type="submit" value="Asignar Tarea" class="btn-asignar">
            </form>
        </div>
        <div id="control-tiempos">
            <h3>Control de Tiempos de Servicio</h3>
            <table>
                <thead>
                    <tr>
                        <th>Mecánico</th>
                        <th>Tarea Asignada</th>
                        <th>Tiempo Estimado</th>
                        <th>Tiempo Real</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Conexión a la base de datos para obtener las tareas asignadas
                        try {
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taller", "usuario", "contraseña");
                            stmt = conn.createStatement();
                            String sql = "SELECT m.nombre, t.nombre_tarea, t.tiempo_estimado, t.tiempo_real, t.estado " +
                                         "FROM tareas t " +
                                         "JOIN mecanicos m ON t.id_mecanico = m.id";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String mecanico = rs.getString("nombre");
                                String tarea = rs.getString("nombre_tarea");
                                int tiempoEstimado = rs.getInt("tiempo_estimado");
                                int tiempoReal = rs.getInt("tiempo_real");
                                String estado = rs.getString("estado");
                    %>
                    <tr>
                        <td><%= mecanico %></td>
                        <td><%= tarea %></td>
                        <td><%= tiempoEstimado %> horas</td>
                        <td><%= tiempoReal %> horas</td>
                        <td><%= estado %></td>
                    </tr>
                    <% 
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException se) {
                                se.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </section>

<%@ include file="footer.jsp" %>
</body>
</html>
