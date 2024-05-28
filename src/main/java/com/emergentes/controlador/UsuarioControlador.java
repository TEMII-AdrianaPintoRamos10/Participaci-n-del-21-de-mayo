package com.emergentes.controlador;

import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RUBEN
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try{
            UsuarioDAO dao = new UsuarioDAOimpl();
            int id;
            Usuario cli = new Usuario();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch(action){
                case "add":
                    request.setAttribute("usuario", cli);
                    request.getRequestDispatcher("frmusuario.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    cli = dao.getById(id);
                    request.setAttribute("usuario", cli);
                    request.getRequestDispatcher("frmusuario.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("UsuarioControlador");
                    break;
                case "view":
                    // Obtener la lista de registros
                    List<Usuario> lista = dao.getAll();
                    request.setAttribute("usuarios", lista);
                    request.getRequestDispatcher("usuarios.jsp").forward(request, response);
                    break;
            }
        }catch(Exception ex){
            System.out.println("Error "+ex.getMessage());
        }
     
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          int id = Integer.parseInt(request.getParameter("id"));
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Usuario cli = new Usuario();
        
        cli.setId(id);
        cli.setNombres(nombres);
        cli.setApellidos(apellidos);
        cli.setEmail(email);
        cli.setPassword(password);
        
        UsuarioDAO dao = new UsuarioDAOimpl();
        if(id == 0){
            try {
                // Nuevo registro
                dao.insert(cli);
            } catch (Exception ex) {
                System.out.println("Error al insertar "+ex.getMessage());
            }
        }else{
            try {
                // Edicion de registro
                dao.update(cli);
            } catch (Exception ex) {
                    System.out.println("Error al editar "+ex.getMessage());
            }
        }
        response.sendRedirect("UsuarioControlador");
      
    }


}
