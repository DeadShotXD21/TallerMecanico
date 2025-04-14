<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro Taller Mecánico</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/registro.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
    <div class="contenedor">
        <div class="img">
            <img src="<%= request.getContextPath() %>/images/registro1.png" alt="Fondo Taller Mecánico">
        </div>
        <div class="contenido-login">
<form id="formulario_registro" name="formulario_registro" method="post" action="procesarRegistro.jsp">
    <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo Taller Mecánico" class="logo-registro">
    <h2>Regístrate en el Taller Mecánico</h2>

    <div class="input-div">
        <div class="i"><i class="fas fa-user"></i></div>
        <div class="div"><input type="text" name="nombre" placeholder="Nombre Completo" required></div>
    </div>

    <div class="input-div">
        <div class="i"><i class="fas fa-envelope"></i></div>
        <div class="div"><input type="email" name="correo" placeholder="Correo Electrónico" required></div>
    </div>

    <div class="input-div">
        <div class="i"><i class="fas fa-phone"></i></div>
        <div class="div"><input type="text" name="telefono" placeholder="Número de Teléfono" required></div>
    </div>

    <div class="input-div">
        <div class="i"><i class="fas fa-lock"></i></div>
        <div class="div"><input type="password" name="clave" placeholder="Contraseña" required></div>
    </div>

    <div class="input-div">
        <div class="i"><i class="fas fa-lock"></i></div>
        <div class="div"><input type="password" name="clave2" placeholder="Confirmar Contraseña" required></div>
    </div>

    <input type="submit" id="registro" class="btn" value="Registrar">
</form>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="<%= request.getContextPath() %>/js/registrate.js"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>

