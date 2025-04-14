<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Facturación y Pagos</title>
    <link rel="stylesheet" href="../css/estilos.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<section id="cuerpo">
    <h2>Facturación y Pagos</h2>

    <!-- Lógica JSP para manejar la creación de presupuestos y pagos -->
    <%
        String mensaje = null;
        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");

            // Cálculo de precio basado en los repuestos
            double precioTotal = 0;

            if (accion.equals("generar_presupuesto")) {
                String vehiculo = request.getParameter("vehiculo");
                String descripcion = request.getParameter("descripcion");
                String precioStr = request.getParameter("precio");

                try {
                    precioTotal = Double.parseDouble(precioStr); // Aquí agregamos el precio manual ingresado
                    // Simulamos un presupuesto simple
                    mensaje = "Presupuesto generado para el vehículo " + vehiculo + " con un total de $" + precioTotal;
                } catch (NumberFormatException e) {
                    mensaje = "Error: El precio debe ser un número válido.";
                }
            }

            // Registro de pago
            if (accion.equals("registrar_pago")) {
                String metodoPago = request.getParameter("metodo_pago");
                String montoStr = request.getParameter("monto");

                try {
                    double monto = Double.parseDouble(montoStr);
                    mensaje = "Pago registrado: " + metodoPago + " por un monto de $" + monto;
                } catch (NumberFormatException e) {
                    mensaje = "Error: El monto debe ser un número válido.";
                }
            }

            // Emisión de factura
            if (accion.equals("emitir_factura")) {
                String cliente = request.getParameter("cliente");
                String vehiculo = request.getParameter("vehiculo");
                String montoStr = request.getParameter("monto");

                try {
                    double monto = Double.parseDouble(montoStr);
                    mensaje = "Factura emitida para " + cliente + " por el vehículo " + vehiculo + " por un monto de $" + monto;
                } catch (NumberFormatException e) {
                    mensaje = "Error: El monto de la factura debe ser un número válido.";
                }
            }
        }
    %>

    <!-- Mostrar mensaje de acción realizada -->
    <% if (mensaje != null) { %>
        <p style="color: green;"><%= mensaje %></p>
    <% } %>

    <!-- Formulario para generar presupuesto -->
    <h3>Generar Presupuesto</h3>
    <form action="facturacion.jsp" method="post">
        <input type="hidden" name="accion" value="generar_presupuesto">
        <label for="vehiculo">Vehículo:</label>
        <input type="text" name="vehiculo" required><br>
        
        <label for="descripcion">Descripción del Servicio:</label>
        <textarea name="descripcion" rows="4" required></textarea><br>
        
        <label for="precio">Precio Estimado ($):</label>
        <input type="number" name="precio" min="0" step="0.01" required><br>

        <input type="submit" value="Generar Presupuesto" class="boton-rojo">
    </form>

    <br>

    <!-- Formulario para registrar pago -->
    <h3>Registrar Pago</h3>
    <form action="facturacion.jsp" method="post">
        <input type="hidden" name="accion" value="registrar_pago">
        
        <label for="metodo_pago">Método de Pago:</label>
        <select name="metodo_pago" required>
            <option value="efectivo">Efectivo</option>
            <option value="tarjeta">Tarjeta</option>
            <option value="transferencia">Transferencia</option>
        </select><br>

        <label for="monto">Monto:</label>
        <input type="number" name="monto" min="0" step="0.01" required><br>

        <input type="submit" value="Registrar Pago" class="boton-rojo">
    </form>

    <br>

    <!-- Formulario para emitir factura -->
    <h3>Emitir Factura</h3>
    <form action="facturacion.jsp" method="post">
        <input type="hidden" name="accion" value="emitir_factura">
        
        <label for="cliente">Cliente:</label>
        <input type="text" name="cliente" required><br>

        <label for="vehiculo">Vehículo:</label>
        <input type="text" name="vehiculo" required><br>

        <label for="monto">Monto de la Factura ($):</label>
        <input type="number" name="monto" min="0" step="0.01" required><br>

        <input type="submit" value="Emitir Factura" class="boton-rojo">
    </form>

    <br>

    <!-- Simulación de generación de PDF -->
    <h3>Simular Generación de PDF</h3>
    <form action="facturacion.jsp" method="post">
        <input type="hidden" name="accion" value="emitir_factura">
        
        <label for="cliente">Cliente:</label>
        <input type="text" name="cliente" required><br>

        <label for="vehiculo">Vehículo:</label>
        <input type="text" name="vehiculo" required><br>

        <label for="monto">Monto de la Factura ($):</label>
        <input type="number" name="monto" min="0" step="0.01" required><br>

        <input type="submit" value="Generar PDF de Factura" class="boton-rojo">
    </form>

</section>

<%@ include file="footer.jsp" %>
</body>
</html>

