<%-- 
    Document   : PaginaInicio
    Created on : 2/05/2024, 11:30:04 p. m.
    Author     : SHERMAN
--%>

<%@page import="java.util.List"%>
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
        <!-- Fuentes de Google -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Kulim+Park:ital,wght@0,200;0,300;0,400;0,600;0,700;1,200;1,300;1,400;1,600;1,700&family=Sour+Gummy:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- DataTyped -->
        <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>

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

            HttpSession BuscarSesion = (HttpSession) request.getSession();

            if (BuscarSesion.getAttribute("DatosDeSesion") == null) {
                request.getRequestDispatcher("Index.jsp").forward(request, response);

            } else {
                UsuarioVo usuVO = (UsuarioVo) BuscarSesion.getAttribute("DatosDeSesion");
                usuario = usuVO.getNombreUsuario();

            }

            String idCargo = "";
            if (BuscarSesion.getAttribute("DatosDeSesion") == null) {
                request.getRequestDispatcher("Index.jsp").forward(request, response);

            } else {
                UsuarioVo usuVO = (UsuarioVo) BuscarSesion.getAttribute("DatosDeSesion");
                idCargo = usuVO.getIdCargo();
                System.out.println(idCargo);
            }
        %>



        <div class="pagina-inicial">
            <h2 class="bienvenido">Bienvenido <%=usuario%> </h2>
            <p class="tareas">Para iniciar con una tarea haga click en
                <span class="typed" 
                      data-typed-items="<%
                          if (idCargo.equals("1")) {
                              out.print("Registrar Usuario., Diseños., Inventario., Ordenes a Producción., Área de Producción., Facturas.");
                          } else if (idCargo.equals("2")) {
                              out.print("Inventario., Área de Producción.");
                          } else if (idCargo.equals("3")) {
                              out.print("Diseños., Ordenes a Producción., Facturas.");
                          } else {
                              out.print("Bienvenido, Seleccione una opción");
                          }
                      %>">
                </span>
            </p>            
        </div>

    </body>
</html>

<script>
    // Obtener los ítems desde el atributo data-typed-items
    const typedElement = document.querySelector('.typed');
    const items = typedElement.getAttribute('data-typed-items').split(', ');

    // Inicializar Typed.js
    new Typed('.typed', {
        strings: items, // Pasar los ítems como strings
        typeSpeed: 70, // Velocidad de tipeo
        backSpeed: 40, // Velocidad al borrar
        backDelay: 2000, // Retraso antes de borrar
        loop: true       // Bucle infinito
    });
</script>
