<%-- 
    Document   : PaginaInicio
    Created on : 2/05/2024, 11:30:04 p. m.
    Author     : SHERMAN
--%>

<%@page import="ModeloDAO.UsuarioDao"%>
<%@page import="ModeloVO.UsuarioVo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>            
    <head>        
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        

        <title>Prisma CP App - Menu Principal</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
            position: relative;
            background-image: url('assets/img/Fondo.jpg'); /* Ruta de la imagen de fondo */
            background-size: 200vw 200vh; /* Ajusta la imagen para que cubra todo el fondo */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
            background-position: center; /* Centra la imagen en el fondo */
        }
        
        h1 {
            text-align: center;
            margin-top: 300px;                                    
            color: #000;
            font-size: 3em;            
        }
        
        p {
            text-align: center;
            color: #000000;
            font-size: 1.2em;
            margin-top: 20px;
        }
        
        span.typed {
            color: #000000;
            font-weight: 600;
        }
        
        .cerrar-sesion {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 1000; /* Asegura que el botón esté por encima de otros elementos */
        }
        
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #04478f;
        }
                       
        </style>
                                  
    </head>
                 
    <body>
        <%
            HttpSession BuscarSesion = (HttpSession) request.getSession();
            String usuario = "";
            if (BuscarSesion.getAttribute("DatosDeSesion") == null) {
                request.getRequestDispatcher("Index.jsp").forward(request, response);
            } else {
                UsuarioVo usuVO = (UsuarioVo) BuscarSesion.getAttribute("DatosDeSesion");
                usuario = usuVO.getNombreUsuario();
            }
        %>
        <!-- ======= Pagina Inicial ======= -->
        <section id="PaginaInicial" class="d-flex flex-column justify-content-center align-items-center">
            <div class="PaginaInicial-container" data-aos="fade-in">
                <h1>Bienvenid@ <%=usuario%></h1>
                <br>
                <p>Para iniciar con una tarea puede hacer click en los módulos del panel izquierdo <span class="typed" data-typed-items="Registrar Usuario, Diseños, Inventario, Ordenes a Producción, Area de Producción, Facturas"></span></p>
            </div>
        </section>
        <!-- Fin Pagina Inicial -->
        
        <!-- Formulario de Cerrar Sesión -->
        <div class="cerrar-sesion">                        
            <form method="post" action="Sesiones">
                <input type="submit" value="Cerrar Sesión">
            </form>
        </div>
        <!-- Fin Formulario de Cerrar Sesión -->
        
    </body>
</html>