<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Recepción de Vehículos</title>
    <link rel="stylesheet" href="../css/recepcion.css" type="text/css">
    <script>
        const modelosPorMarca = {
            Toyota: ["Corolla", "Hilux", "Yaris", "RAV4"],
            Nissan: ["Sentra", "Versa", "X-Trail", "Navara"],
            Chevrolet: ["Aveo", "Sail", "Tracker", "Spark"],
            Hyundai: ["Tucson", "Elantra", "Accent", "Santa Fe"]
        };

        function actualizarModelos() {
            const marcaSelect = document.getElementById("marca");
            const modeloSelect = document.getElementById("modelo");
            const marcaSeleccionada = marcaSelect.value;

            // Limpiar modelos anteriores
            modeloSelect.innerHTML = '<option value="">-- Seleccione Modelo --</option>';

            // Agregar nuevos modelos
            if (marcaSeleccionada && modelosPorMarca[marcaSeleccionada]) {
                modelosPorMarca[marcaSeleccionada].forEach(function(modelo) {
                    const opcion = document.createElement("option");
                    opcion.value = modelo;
                    opcion.text = modelo;
                    modeloSelect.add(opcion);
                });
            }
        }
    </script>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>

    <section id="cuerpo">
        <hr>
        <h2>Recepción de Vehículos</h2>

        <form action="RegistrarRecepcion" method="post">
            <fieldset>
                <legend>Datos del Cliente</legend>
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" required><br>

                <label for="telefono">Teléfono:</label>
                <input type="tel" name="telefono" pattern="^\d{9}$" required><br>

                <label for="email">Email:</label>
                <input type="email" name="email"><br>
            </fieldset>

            <fieldset>
                <legend>Datos del Vehículo</legend>

                <label for="marca">Marca:</label>
                <select name="marca" id="marca" onchange="actualizarModelos()" required>
                    <option value="">-- Seleccione Marca --</option>
                    <option value="Toyota">Toyota</option>
                    <option value="Nissan">Nissan</option>
                    <option value="Chevrolet">Chevrolet</option>
                    <option value="Hyundai">Hyundai</option>
                </select><br>

                <label for="modelo">Modelo:</label>
                <select name="modelo" id="modelo" required>
                    <option value="">-- Seleccione Modelo --</option>
                </select><br>

                <label for="placa">Placa:</label>
                <input type="text" name="placa" required pattern="^[A-Za-z0-9]{6}$"><br>

                <label for="anio">Año:</label>
                <input type="number" name="anio" min="1900" max="2099" required><br>
            </fieldset>

            <fieldset>
                <legend>Orden de Servicio</legend>
                <label for="diagnostico">Diagnóstico Inicial:</label><br>
                <textarea name="diagnostico" rows="4" required></textarea><br>

                <label for="mecanico">Asignar Mecánico:</label>
                <select name="mecanico" required>
                    <option value="">-- Seleccione Mecánico --</option>
                    <%@ include file="mecanicos.jsp" %>
                </select><br>
            </fieldset>

            <br>
            <input type="submit" value="Registrar Recepción">
        </form>
        <hr>

        <h2>Gestión de Órdenes de Servicio</h2>
        <form action="ActualizarOrden" method="post">
            <fieldset>
                <legend>Actualizar Estado de Orden</legend>
                <label for="idOrden">ID de la Orden:</label>
                <input type="number" name="idOrden" required><br>

                <label for="estado">Nuevo Estado:</label>
                <select name="estado" required>
                    <option value="">-- Seleccione --</option>
                    <option value="pendiente">Pendiente</option>
                    <option value="en_proceso">En Proceso</option>
                    <option value="finalizado">Finalizado</option>
                </select><br>

                <input type="submit" value="Actualizar Estado">
            </fieldset>
        </form>

        <br>

        <form action="RegistrarReparacion" method="post">
            <fieldset>
                <legend>Registrar Reparaciones y Repuestos</legend>
                <label for="idOrden">ID de la Orden:</label>
                <input type="number" name="idOrden" required><br>

                <label for="reparaciones">Descripción de Reparaciones:</label><br>
                <textarea name="reparaciones" rows="4" required></textarea><br>

                <label for="repuestos">Repuestos Utilizados:</label><br>
                <textarea name="repuestos" rows="3"></textarea><br>

                <input type="submit" value="Guardar Reparaciones">
            </fieldset>
        </form>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>