<%
    String opcion = request.getParameter("opcion");
%>

<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Punto de Venta</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link <%=(opcion.equals("productos") ? "active" : "")%>" aria-current="page" href="ProductoControlador">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%=(opcion.equals("clientes") ? "active" : "")%>" href="ClienteControlador">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%=(opcion.equals("ventas") ? "active" : "")%>" href="VentaControlador" aria-disabled="true">Ventas</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link <%=(opcion.equals("usuarios") ? "active" : "")%>" href="UsuarioControlador" aria-disabled="true">Usuarios</a>
                    </li>
                    
                </ul>
                <form class="d-flex" role="search">
                    
                    
                    <a href="Logout" class="btn btn-danger">Cerrar sesión</a>
                </form>
            </div>
        </div>
    </nav>
</header>