<%-- 
    Document   : PaginaInicio
    Created on : 2/05/2024, 11:30:04 p. m.
    Author     : SHERMAN
--%>

<%@page import="ModeloDAO.UsuarioDao"%>
<%@page import="ModeloVO.UsuarioVo"%>
<%@page import="javax.servlet.http.HttpSession"%> <!-- Aseguramos importar HttpSession -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Prisma CP App - Menú Principal</title>
        <link rel="stylesheet" href="assets/css/pagina_inicio.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
                 
    <body>
        <%
            // Obtener la sesión actual
            HttpSession buscarSesion = request.getSession(false); // `false` para evitar crear una nueva sesión
            String usuario = "";
            
            if (buscarSesion == null || buscarSesion.getAttribute("DatosDeSesion") == null) {
                // Redirigir al inicio si no hay sesión activa
                response.sendRedirect("Index.jsp");
                return; // Aseguramos que no se ejecute más código después de redirigir
            } else {
                // Recuperar el usuario de la sesión
                UsuarioVo usuVO = (UsuarioVo) buscarSesion.getAttribute("DatosDeSesion");
                usuario = usuVO != null ? usuVO.getNombreUsuario() : "Invitado";
            }
        %>
       
        <div class="pagina-inicial">
            <h2>Bienvenido <%=usuario%> </h2>
            <p>Para iniciar con una tarea haga click en
                <span class="typed" data-typed-items="Registrar Usuario, Diseños, Inventario, Órdenes a Producción, Área de Producción, Facturas"></span>
            </p>            
        </div>
                             
    </body>
</html>
