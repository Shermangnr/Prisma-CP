<%-- 
    Document   : RegistrarUsuario
    Created on : 10/03/2024, 10:22:41 p. m.
    Author     : SHERMAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
        <link rel="icon" type="image/png" href="assets/iconos/impresora.png">
        <link rel="stylesheet" href="assets/css/Index.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        
        <div class="card login-container">
            <div class="card-title">
                <h2>Iniciar Sesión</h2>
            </div>

            <div class="card-body">
                <form method="post" action="EmpleadoControlador">
                    <label class="form-label" for="textNombre">Usuario:</label>
                    <input class="form-control" type="text" id="textNombre" name="textNombre" required>
                    <label class="form-label" for="textContrasena">Contraseña:</label>
                    <input class="form-control" type="password" id="textContrasena" name="textContrasena" required>
                    <button class="btn btn-primary mt-1" type="submit">Iniciar sesión</button>
                    <input type="hidden" value="4" name="opcion">
                </form>
                <%-- Mensajes de error y éxito --%>
                <% if (request.getAttribute("mensajeError") != null) { %>
                <div id="mensaje" class="alert alert-danger" role="alert">
                    ${mensajeError}
                </div>
                <% } else if (request.getAttribute("mensajeExito") != null) { %>
                <div id="mensaje" class="success-message">
                    ${mensajeExito}
                </div>
                <% }%>
            </div>
        </div>

        <div class="footer-logo">PrismaCP-Aplication <span>&COPY;</span> </div>

        <footer>&copy; Grupo Softeam</footer>

    </body>
</html>

<script>
    // Función para ocultar el mensaje después de 10 segundos
    window.onload = function () {
        setTimeout(function () {
            var message = document.getElementById("mensaje");
            if (message) {
                message.style.display = "none";
            }
        }, 5000); // 10000 milisegundos = 10 segundos
    };
</script>
