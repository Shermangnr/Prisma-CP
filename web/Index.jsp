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
    <link rel="stylesheet" href="assets/css/Index.css">
    <style>
        
    </style>
</head>
<body>
    <img class="header-logo" src="logoempresa.png" alt="Logo">
    <div class="login-container">
        <h1>Iniciar Sesión</h1>
        <form method="post" action="EmpleadoControlador">
            <label for="textNombre">Usuario:</label>
            <input type="text" id="textNombre" name="textNombre" required>
            <label for="textContrasena">Contraseña:</label>
            <input type="password" id="textContrasena" name="textContrasena" required>
            <button type="submit">Iniciar sesión</button>
            <input type="hidden" value="4" name="opcion">
        </form>
        <div class="error-message">
            <% if (request.getAttribute("mensajeError") != null) { %>
                ${mensajeError}
            <% } else if (request.getAttribute("mensajeExito") != null) { %>
                ${mensajeExito}
            <% } %>
        </div>
    </div>
        
        <div class="footer-logo">PrismaCP-Aplication <span>&COPY;</span> </div>

        <footer>&copy; Grupo Softeam</footer>

</body>
</html>
