<%-- 
    Document   : OrdenProduccion
    Created on : 11/04/2024, 8:56:27 p. m.
    Author     : SHERMAN
--%>

<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ProduccionDao"%>
<%@page import="ModeloVO.ProduccionVo"%>
<%@page import="ModeloVO.UsuarioVo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
    <title>Enviar órdenes a producción</title>
    <style>
        /* Estilos CSS para dar un diseño agradable */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
            position: relative;
        }
        
        h1 {
            text-align: center;
            margin-top: 30px;
            color: #007bff;
        }
        
        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            
        }
   
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #555;
        }
        
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s;
            appearance: none; 
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>'); 
            background-repeat: no-repeat;
            background-position: right 10px center;            
            
        }
        
        select:focus {
            outline: none;
            border-color: #040b72;
        }
        
        input[type="file"],
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s;
            border-color: #040b72;
        }
        
        input[type="file"]:focus,
        input[type="text"]:focus {
            outline: none;
            border-color: #040b72;
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
            HttpSession BuscarSesion = (HttpSession)request.getSession();
            String usuario ="";
            if (BuscarSesion.getAttribute("DatosDeSesion")==null) {
            request.getRequestDispatcher("Index.jsp").forward(request, response);
    
            }else {
            UsuarioVo usuVO = (UsuarioVo)BuscarSesion.getAttribute("DatosDeSesion");
            usuario = usuVO.getNombreUsuario();
        
            }
            %>
    
    <div class="container">
        <h1>Enviar órdenes a producción</h1>
        <form action="ProduccionControlador" method="post" enctype="multipart/form-data">
            <label for="tipoOrden">Tipo de Orden:</label>
            <select id ="tipoOrden" name="tipoOrden">
                    <%  
                        ProduccionVo ProdVO = new ProduccionVo();
                        ProduccionDao ProdDao = new ProduccionDao(ProdVO);                        
                        List <ProduccionVo> tiposProd = ProdDao.consultarTipoProd();
                        for (ProduccionVo tipoOrdProd : tiposProd) {
                    %>
                        <option value="<%= tipoOrdProd.getTipoOrden() %>"><%= tipoOrdProd.getTipoOrden() %></option>
                    <% } %>            
            </select>

            <label for="cantidad">Cantidad:</label>
            <input type="text" id="cantidad" name="cantidad" required>
            
            <label for="archivo">Selecciona un archivo PDF:</label>
            <input type="file" id="archivodiseno" name="archivodiseno" accept=".pdf" required>

            <label for="descripcionOrden">Descripción del trabajo:</label>
            <input type="text" id="descripcionOrden" name="descripcionOrden" required>

            <label for="Empleado">Empleado Solicitante: <%=usuario%> </label>                                    

            <input type="hidden" value="1" name="opcionProduccion">
                      
            <input type="submit" value="Enviar">
        </form>
    </div>     
</body>
</html>
