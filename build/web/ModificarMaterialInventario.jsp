<%-- 
    Document   : ModificarMaterialInventario
    Created on : 12/04/2024, 9:16:41 p. m.
    Author     : SHERMAN
--%>

<%@ page import="ModeloDAO.InventarioDao" %>
<%@ page import="ModeloVO.InventarioVo" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificación de Inventario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {            
            text-align: center;
            margin-top: 30px;
            color: #007bff;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #040b72;
        }

        button {
            width: 50%;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #04478f;
        }

        .error-message {
            color: red;
        }

        .success-message {
            color: green;
        }
    </style>
</head>
<body>
    
    <h1>Modificación de Inventario</h1>
    
    <form method="get" action="InventarioControlador">
        <label for="textNombreMat">Nombre Material: </label>
        <input type="text" id="textNombreMatAct" name="textNombreMatAct" required><br><br>
        <label for="Cantidad">Cantidad: </label>
        <input type="text" id="textCantidadAct" name="textCantidadAct" required><br><br>
        <label for="Descripcion">Descripción: </label>
        <input type="text" id="textDescripcionAct" name="textDescripcionAct" required><br><br>
        <label for="Tamano">Tamaño: </label>
        <input type="text" id="textTamanoAct" name="textTamanoAct" required><br><br>        
        <input type="hidden" name="idMaterialAct" id="idMaterialInput" required>
        
        <button>Guardar cambios</button>               
         
        <input type="hidden" value="2" name="opcionInv">
    </form>
    
    <!-- Mensaje de éxito -->
    <div class="suces-message">
    <% if ("guardadoExitoso".equals(request.getParameter("accion"))) { %>
        Datos guardados con éxito!
    <% } %>
    </div>
    
    <!-- Mensaje de error -->
    <div class="error-message">
        <% if (request.getAttribute("mensajeError")!=null) { %>
            ${mensajeError}
        <% } %>
    </div>
    
    <script>
    // Función para mostrar el popup cuando se cumpla la condición
    function mostrarPopup() {
        // Verificar si el parámetro 'accion' es igual a 'guardadoExitoso'
        var urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('accion') === 'guardadoExitoso') {
            // Mostrar el popup con el mensaje
            alert("Datos modificados con éxito!");
        }
    }

    // Llamar a la función cuando la página se cargue
    window.onload = mostrarPopup;
    </script>
    
    
    <!-- JavaScript para la funcionalidad de búsqueda y guardar -->
    <script>
        var queryString = window.location.search;
        var idMaterial = queryString.substring(queryString.indexOf('id=') + 3);
        document.getElementById("idMaterialInput").value = idMaterial;    
    
    function guardar() {
            
            alert("Guardado exitoso");
        }
        
    function cerrarVentanaEmergente() {
            alert("Guardado exitoso");
            window.opener.location.reload(); // Recargar la página principal
            window.close(); // Cerrar la ventana emergente
        }
    </script>
</body>
</html>
