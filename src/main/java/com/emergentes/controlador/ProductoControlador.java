package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductoDAO dao = new ProductoDAOimpl();
            int id;
            Producto producto = new Producto();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    producto = dao.getById(id);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error fatal " + ex.getMessage());
        }
    }

    
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    float precio = Float.parseFloat(request.getParameter("precio"));
    
    Producto producto = new Producto();
    
    producto.setId(id);
    producto.setNombre(nombre);
    producto.setDescripcion(descripcion);
    producto.setPrecio(precio);
    
    ProductoDAO dao = new ProductoDAOimpl();
    
    try {
        if (id == 0) {
            // Nuevo producto
            dao.insert(producto);
        } else {
            // Actualizar producto existente
            dao.update(producto);
        }
        response.sendRedirect("ProductoControlador");
    } catch (Exception ex) {
        Logger.getLogger(ProductoControlador.class.getName()).log(Level.SEVERE, null, ex);
        response.sendRedirect("error.jsp"); // Redirigir a una página de error
    }
}


}
