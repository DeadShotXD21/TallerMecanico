// Verifica si hay un mensaje y tipo de alerta definidos por el servidor
document.addEventListener('DOMContentLoaded', function () {
    const mensaje = document.body.dataset.mensaje;
    const tipoAlerta = document.body.dataset.tipoAlerta;

    if (mensaje && tipoAlerta) {
        if (tipoAlerta === 'error') {
            Swal.fire({
                icon: 'error',
                title: '¡Error!',
                text: mensaje,
                confirmButtonColor: '#e74c3c'
            });
        } else if (tipoAlerta === 'success') {
            Swal.fire({
                icon: 'success',
                title: 'Movimiento registrado',
                text: mensaje,
                confirmButtonColor: '#2ecc71'
            });
        }
    }
});
