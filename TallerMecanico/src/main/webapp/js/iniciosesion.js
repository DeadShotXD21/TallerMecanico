document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('formulario_login');

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        const email = form.querySelector('input[type="email"]').value.trim();
        const password = form.querySelector('input[type="password"]').value.trim();

        if (email === '' || password === '') {
            Swal.fire({
                icon: 'warning',
                title: 'Campos Vacíos',
                text: 'Por favor, complete todos los campos.'
            });
            return;
        }

        // Hacer una petición AJAX al servidor para verificar las credenciales
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'procesarLogin.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Parsear la respuesta
                const response = JSON.parse(xhr.responseText);

                if (response.success) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Inicio de sesión exitoso',
                        text: 'Bienvenido al sistema',
                        timer: 2000,
                        showConfirmButton: false
                    }).then(() => {
                        // Redirigir dependiendo del rol
                        if (response.rol === 'personal') {
                            window.location.href = 'admin.jsp'; // Redirigir al panel de administración
                        } else {
                            window.location.href = 'inicio.jsp'; // Redirigir al inicio para clientes
                        }
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Credenciales Incorrectas',
                        text: 'Verifique su correo y contraseña'
                    });
                }
            }
        };

        // Enviar los datos al servidor (correo y contraseña)
        xhr.send('email=' + encodeURIComponent(email) + '&clave=' + encodeURIComponent(password));
    });
});