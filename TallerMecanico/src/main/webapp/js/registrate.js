document.addEventListener("DOMContentLoaded", function () {
    var form = document.forms['formulario_registro'];

    if (form) {
        form.addEventListener("submit", function (e) {
            if (!validateFormRegistro()) {
                e.preventDefault(); // Detiene el envío si hay errores
            }
        });
    }
});

function validateFormRegistro() {
    var nombre = document.getElementsByName('name')[0].value.trim();
    var email = document.getElementsByName('email')[0].value.trim();
    var especialidad = document.getElementsByName('especialidad')[0].value.trim();
    var telefono = document.getElementsByName('telefono')[0].value.trim();
    var clave = document.getElementsByName('clave')[0].value.trim();
    var clave2 = document.getElementsByName('clave2')[0].value.trim();

    if (!nombre || !email || !especialidad || !telefono || !clave || !clave2) {
        Swal.fire({
            title: 'Error',
            text: 'Todos los campos deben ser completados.',
            icon: 'error',
            confirmButtonText: 'Aceptar'
        });
        return false;
    }

    if (clave !== clave2) {
        Swal.fire({
            title: 'Error',
            text: 'Las contraseñas no coinciden.',
            icon: 'error',
            confirmButtonText: 'Aceptar'
        });
        return false;
    }

    return true;
}
