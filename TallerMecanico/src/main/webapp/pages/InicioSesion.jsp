<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taller Mecánico</title>
    <link rel="stylesheet" href="../css/iniciosesion.css" type="text/css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>

    <div class="login-wrapper">
        <section>
            <form id="formulario_login" name="formulario_login" method="post">
                <h1>Login</h1>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="email" required>
                    <label>Usuario</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" required>
                    <label>Contraseña</label>
                </div>
                <div class="forget">
                    <p><input type="checkbox">Recordarme 
                    <a href="registro.jsp"> ¿Olvidó su contraseña?</a></p>
                </div>
                <button>Iniciar Sesión</button>
                <div class="register">
                    <p>No tengo una cuenta <a href="registro.jsp">Registrarse</a></p>
                </div>
            </form>
        </section>
    </div>

    <%@ include file="footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<%= request.getContextPath() %>/js/iniciosesion.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>

