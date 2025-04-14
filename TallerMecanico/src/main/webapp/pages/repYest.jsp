<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte y Estadísticas</title>
    <link rel="stylesheet" href="../css/estilos.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Ajustes para hacer los gráficos más pequeños */
        #graficoIngresos, #graficoServicios {
            width: 400px;  /* Ancho del gráfico */
            height: 300px; /* Altura del gráfico */
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>

    <section id="reporte-estadisticas">
        <h2>Reporte y Estadísticas de Taller</h2>

        <!-- Reporte de Ingresos por Mes -->
        <div id="reporte-ingresos">
            <h3>Reporte de Ingresos por Mes</h3>
            <table>
                <thead>
                    <tr>
                        <th>Mes</th>
                        <th>Ingreso Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Enero</td>
                        <td>$5,000</td>
                    </tr>
                    <tr>
                        <td>Febrero</td>
                        <td>$6,200</td>
                    </tr>
                    <tr>
                        <td>Marzo</td>
                        <td>$4,800</td>
                    </tr>
                    <tr>
                        <td>Abril</td>
                        <td>$7,150</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Estadísticas de Servicios Más Solicitados -->
        <div id="estadisticas-servicios">
            <h3>Estadísticas de Servicios Más Solicitados</h3>
            <table>
                <thead>
                    <tr>
                        <th>Servicio</th>
                        <th>Solicitudes</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mantenimiento Preventivo</td>
                        <td>35</td>
                    </tr>
                    <tr>
                        <td>Reparación de Motor</td>
                        <td>25</td>
                    </tr>
                    <tr>
                        <td>Cambio de Aceite</td>
                        <td>18</td>
                    </tr>
                    <tr>
                        <td>Reemplazo de Neumáticos</td>
                        <td>20</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Control de Productividad de Mecánicos -->
        <div id="productividad-mecanicos">
            <h3>Control de Productividad de Mecánicos</h3>
            <table>
                <thead>
                    <tr>
                        <th>Mecánico</th>
                        <th>Tareas Completadas</th>
                        <th>Promedio de Tiempo por Tarea (hrs)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Carlos López</td>
                        <td>50</td>
                        <td>3.2</td>
                    </tr>
                    <tr>
                        <td>Ana Torres</td>
                        <td>45</td>
                        <td>3.5</td>
                    </tr>
                    <tr>
                        <td>Luis Ramírez</td>
                        <td>40</td>
                        <td>4.0</td>
                    </tr>
                    <tr>
                        <td>Pedro García</td>
                        <td>30</td>
                        <td>3.8</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Gráfico de Ingresos por Mes -->
        <div id="grafico-ingresos">
            <h3>Gráfico de Ingresos por Mes</h3>
            <canvas id="graficoIngresos"></canvas>
            <script>
                var ctx = document.getElementById('graficoIngresos').getContext('2d');
                var graficoIngresos = new Chart(ctx, {
                    type: 'line',  // Tipo de gráfico (línea)
                    data: {
                        labels: ['Enero', 'Febrero', 'Marzo', 'Abril'], // Meses
                        datasets: [{
                            label: 'Ingresos Totales',
                            data: [5000, 6200, 4800, 7150],  // Ingresos de cada mes
                            borderColor: 'rgba(75, 192, 192, 1)',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            fill: true,
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            </script>
        </div>

        <!-- Gráfico de Servicios Más Solicitados -->
        <div id="grafico-servicios">
            <h3>Gráfico de Servicios Más Solicitados</h3>
            <canvas id="graficoServicios"></canvas>
            <script>
                var ctx = document.getElementById('graficoServicios').getContext('2d');
                var graficoServicios = new Chart(ctx, {
                    type: 'pie',  // Tipo de gráfico (pastel)
                    data: {
                        labels: ['Mantenimiento Preventivo', 'Reparación de Motor', 'Cambio de Aceite', 'Reemplazo de Neumáticos'], // Servicios
                        datasets: [{
                            label: 'Servicios Solicitados',
                            data: [35, 25, 18, 20],  // Número de solicitudes por servicio
                            backgroundColor: [
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(54, 162, 235, 0.2)'
                            ],
                            borderColor: [
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(54, 162, 235, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true
                    }
                });
            </script>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
