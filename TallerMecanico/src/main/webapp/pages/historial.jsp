<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Vehículos y Clientes</title>
    <link rel="stylesheet" href="../css/estilos.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>

    <section id="historial">
        <h2>Historial de Vehículos y Clientes</h2>

        <!-- Formulario para buscar historial por vehículo -->
        <form id="busqueda-historial" action="buscarHistorial.jsp" method="post">
            <label for="placa">Placa del Vehículo:</label>
            <input type="text" id="placa" name="placa" required><br><br>

            <label for="cliente">Nombre del Cliente:</label>
            <input type="text" id="cliente" name="cliente"><br><br>

            <label for="fecha">Fecha de Atención (opcional):</label>
            <input type="date" id="fecha" name="fecha"><br><br>

            <input name="consultar" type="submit" value="Consultar Historial" class="button">
        </form>

        <!-- Resultado de la búsqueda (Historial de servicios) -->
        <div id="resultado-historial">
            <h3>Historial de Servicios</h3>
            <table border="1" cellpadding="10" cellspacing="0">
                <thead>
                    <tr>
                        <th>Fecha de Servicio</th>
                        <th>Tipo de Servicio</th>
                        <th>Repuestos Utilizados</th>
                        <th>Notas del Servicio</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Simulamos un historial para varios vehículos
                        String placaBusqueda = request.getParameter("placa");
                        String clienteBusqueda = request.getParameter("cliente");
                        String fechaBusqueda = request.getParameter("fecha");

                        // Historial de servicios por vehículo
                        Map<String, List<Map<String, String>>> historial = new HashMap<>();

                        // Vehículo A
                        List<Map<String, String>> historialVehiculoA = new ArrayList<>();
                        Map<String, String> servicio1 = new HashMap<>();
                        servicio1.put("fecha", "01/02/2025");
                        servicio1.put("tipo", "Mantenimiento Preventivo");
                        servicio1.put("repuestos", "Filtro de aceite, Aceite");
                        servicio1.put("notas", "Revisión general del motor y cambio de piezas.");
                        historialVehiculoA.add(servicio1);

                        Map<String, String> servicio2 = new HashMap<>();
                        servicio2.put("fecha", "15/03/2025");
                        servicio2.put("tipo", "Reparación de Motor");
                        servicio2.put("repuestos", "Cable de encendido");
                        servicio2.put("notas", "Reemplazo de cables de encendido dañados.");
                        historialVehiculoA.add(servicio2);

                        historial.put("ABC123", historialVehiculoA); // Vehículo A con placa ABC123

                        // Vehículo B
                        List<Map<String, String>> historialVehiculoB = new ArrayList<>();
                        Map<String, String> servicioB1 = new HashMap<>();
                        servicioB1.put("fecha", "10/02/2025");
                        servicioB1.put("tipo", "Cambio de Filtro");
                        servicioB1.put("repuestos", "Filtro de aire");
                        servicioB1.put("notas", "Reemplazo del filtro de aire.");
                        historialVehiculoB.add(servicioB1);

                        historial.put("XYZ456", historialVehiculoB); // Vehículo B con placa XYZ456

                        // Filtrado de los resultados por placa
                        if (placaBusqueda != null && !placaBusqueda.isEmpty()) {
                            List<Map<String, String>> servicios = historial.get(placaBusqueda);
                            if (servicios != null) {
                                for (Map<String, String> servicio : servicios) {
                    %>
                        <tr>
                            <td><%= servicio.get("fecha") %></td>
                            <td><%= servicio.get("tipo") %></td>
                            <td><%= servicio.get("repuestos") %></td>
                            <td><%= servicio.get("notas") %></td>
                        </tr>
                    <% 
                                }
                            } else {
                                out.print("<tr><td colspan='4'>No se encontraron servicios para la placa: " + placaBusqueda + "</td></tr>");
                            }
                        } else {
                            out.print("<tr><td colspan='4'>Debe ingresar una placa de vehículo para realizar la búsqueda.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
