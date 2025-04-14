<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taller Mecánico</title>
    <link rel="stylesheet" href="../css/inicio.css" type="text/css">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<script src="../js/texto.js"></script>

<video autoplay loop muted id="video_background">
    <source src="../videos/auto.mp4" type="video/mp4">
</video>

<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<section id="inicio">
    <div class="container">
        <h1>Bienvenidos a TecnoFix</h1>
        <p>En TecnoFix, nos dedicamos a ofrecer los mejores servicios automotrices para mantener tu vehículo en perfecto estado. Con años de experiencia, garantizamos un servicio rápido y profesional.</p>
    </div>
</section>

<section class="grid-2x2">
    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/bienvenida.png');">
                    <div class="overlay">
                        <h2>BIENVENIDA</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front" style="background-image: url('../images/bienvenida.png');">
                        <ul>En nuestro taller, nos dedicamos a ofrecer los mejores servicios automotrices para mantener tu vehículo en perfecto estado. Con años de experiencia, garantizamos un servicio rápido y profesional.</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/beneficios.png');">
                    <div class="overlay">
                        <h2>BENEFICIOS</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front" style="background-image: url('../images/beneficios.png');color: black; font-weight: bold;">
                        <ul>
                            <ul>✔  Servicio rápido y confiable</ul>
                            <ul>✔  Atención personalizada</ul>
                            <ul>✔  Precios competitivos</ul>
                            <ul>✔  Piezas originales</ul>
                            <ul>✔  Expertos en todo tipo de vehículos</ul>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/mision.png');">
                    <div class="overlay">
                        <h2>MISIÓN</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front" style="background-image: url('../images/mision.png');font-weight: bold;">
                        <ul>Proporcionar un servicio automotriz de alta calidad y accesible, garantizando la satisfacción del cliente a través de un trabajo profesional, seguro y con tecnología de punta.</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid-item">
        <div class="card-flip">
            <div class="card-inner">
                <div class="card-front" style="background-image: url('../images/vision.png');">
                    <div class="overlay">
                        <h2>VISIÓN</h2>
                    </div>
                </div>
                <div class="card-back">
                    <div class="card-front" style="background-image: url('../images/vision.png');font-weight: bold;">
                        <ul>Ser reconocidos como el taller líder en soluciones automotrices de la región, destacando por excelencia, innovación y compromiso con nuestros clientes.</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Redes sociales -->
<div class="wsp">
    <a href="https://wa.me/1234567890" target="_blank">
        <img src="../images/whatsapp.png" alt="WhatsApp">
    </a>
</div>
<div class="ig">
    <a href="https://instagram.com/taller_mecanico" target="_blank">
        <img src="../images/instagram.png" alt="Instagram">
    </a>
</div>

<%@ include file="footer.jsp" %>

<script>
    document.querySelectorAll('.card-flip').forEach(card => {
        card.addEventListener('click', () => {
            card.classList.toggle('flipped');
        });
    });
</script>

<script src="../js/texto.js"></script>
</body>
</html>

