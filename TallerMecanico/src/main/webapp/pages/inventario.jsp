<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Conecta.RenzoConnection" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventario de Repuestos</title>
    <link rel="stylesheet" href="../css/inventario.css" type="text/css">
</head>

<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String mensaje = null;
    String tipoAlerta = null;

    try {
        conn = RenzoConnection.getConnection();

        if (conn != null) {
            if (request.getParameter("nombre") != null) {
                String nombre = request.getParameter("nombre");
                String tipo = request.getParameter("tipo");
                String cantidadStr = request.getParameter("cantidad");

                try {
                    int cantidad = Integer.parseInt(cantidadStr);

                    if (tipo.equals("entrada")) {
                        String query = "UPDATE inventario SET stock = stock + ? WHERE nombre = ?";
                        stmt = conn.prepareStatement(query);
                        stmt.setInt(1, cantidad);
                        stmt.setString(2, nombre);
                        int rowsUpdated = stmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            mensaje = "Entrada de " + cantidad + " unidad(es) del repuesto '" + nombre + "' registrada correctamente.";
                            tipoAlerta = "success";
                        }

                    } else if (tipo.equals("salida")) {
                        String query = "UPDATE inventario SET stock = stock - ? WHERE nombre = ? AND stock >= ?";
                        stmt = conn.prepareStatement(query);
                        stmt.setInt(1, cantidad);
                        stmt.setString(2, nombre);
                        stmt.setInt(3, cantidad);
                        int rowsUpdated = stmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            mensaje = "Salida de " + cantidad + " unidad(es) del repuesto '" + nombre + "' registrada correctamente.";
                            tipoAlerta = "success";
                        } else {
                            mensaje = "Stock insuficiente";
                            tipoAlerta = "error";
                        }
                    }

                } catch (NumberFormatException e) {
                    mensaje = "Error: cantidad inválida.";
                    tipoAlerta = "error";
                }
            }
        } else {
            mensaje = "Error: No se pudo establecer la conexión con la base de datos.";
            tipoAlerta = "error";
        }
    } catch (Exception e) {
        mensaje = "Error al conectar con la base de datos: " + e.getMessage();
        tipoAlerta = "error";
        e.printStackTrace();
    }
%>

<body
    <% if (mensaje != null) { %>
        data-mensaje="<%= mensaje %>"
        data-tipo-alerta="<%= tipoAlerta %>"
    <% } %>
>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<section id="modulo-inventario">

    <h2>Control de Inventario de Repuestos</h2>

    <form action="inventario.jsp" method="post">
        <fieldset>
            <legend>Registrar Movimiento</legend>

            <label for="nombre">Nombre del Repuesto:</label>
            <select name="nombre" required>
                <option value="">-- Seleccione --</option>
                <option value="Filtro de Aceite">Filtro de Aceite</option>
                <option value="Pastillas de Freno">Pastillas de Freno</option>
                <option value="Bujías">Bujías</option>
                <option value="Aceite Motor">Aceite Motor</option>
            </select><br>

            <label for="tipo">Tipo de Movimiento:</label>
            <select name="tipo" required>
                <option value="">-- Seleccione --</option>
                <option value="entrada">Entrada</option>
                <option value="salida">Salida</option>
            </select><br>

            <label for="cantidad">Cantidad:</label>
            <input type="number" name="cantidad" min="1" required><br>

            <input type="submit" value="Registrar Movimiento" class="boton-rojo">
        </fieldset>
    </form>

    <br>
    <h3>Listado de Repuestos</h3>
    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>Repuesto</th>
                <th>Stock Actual</th>
                <th>Stock Mínimo</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    if (conn != null) {
                        String query = "SELECT nombre, stock, stock_minimo FROM inventario";
                        stmt = conn.prepareStatement(query);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                            String nombre = rs.getString("nombre");
                            int stockActual = rs.getInt("stock");
                            int stockMin = rs.getInt("stock_minimo");
                            String estado = stockActual < stockMin ? "⚠ Bajo Stock" : "✔ Stock Suficiente";
                            String color = stockActual < stockMin ? "style='color: red;'" : "style='color: green;'";
            %>
                            <tr>
                                <td><%= nombre %></td>
                                <td><%= stockActual %></td>
                                <td><%= stockMin %></td>
                                <td <%= color %>><%= estado %></td>
                            </tr>
            <%
                        }
                    } else {
                        out.println("<tr><td colspan='4'>No se pudo realizar la consulta debido a la falta de conexión.</td></tr>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='4'>Error al consultar el inventario: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</section>

<%
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../js/inventario.js"></script>
</body>
</html>