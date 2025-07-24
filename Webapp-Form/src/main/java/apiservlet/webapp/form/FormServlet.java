package apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/registro")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String username = req.getParameter("username");// esto es de name en index para enlazar
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String pais = req.getParameter("pais");
        String [] lenguajes =req.getParameterValues("lenguajes");
        String [] roles =req.getParameterValues("roles");
        String idioma = req.getParameter("idioma");
        boolean habilitar = req.getParameter("habilitar") != null &&
                req.getParameter("habilitar").equals("on");
        String secreto = req.getParameter("secreto");

        Map<String , String> errores =new HashMap<>();

        if( username == null || username.isBlank() ){
            errores.put("username", "Usuario es requerido");
        }
        if( password == null || password.isBlank() ){
            errores.put("password", "pasword  no puede ser vacio ");
        }
        if( email == null || !email.contains("@") ){
            errores.put("email" , "email necesita un arroba @ ");
        }
        if( pais == null || pais.equals("") || pais.equals(" ")){ //esto lo valida .isblank
            errores.put("pais" , "pais no puede ser vacio ");
        }

        if ( lenguajes == null || lenguajes.length == 0 ){
            errores.put("lenguajes", "lenguajes no puede ser vacio ");
        }
        if ( roles == null || roles.length == 0 ){
            errores.put("roles" , "roles no puede ser vacio ");
        }
        if (idioma == null ){
            errores.put("idioma", "debes selecionar el idioma ");
        }
            if ( errores.isEmpty() ) {
        try (PrintWriter out = resp.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>  Resultado Form  </title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Resultado Form </h1>");
            out.println("<ul>");

                out.println("          <li> Username :" + username + "</li>");
                out.println("          <li>  Password :" + password + "</li>");
                out.println("          <li>  Email  :" + email + "</li>");
                out.println("          <li>  Pais  :" + pais + "</li>");

                out.println("          <li> Lenguajes : <ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {
                    out.println("      <li>" + lenguaje + "</li>");
                });
                out.println("           </ul></li>");

                out.println("          <li> Roles : <ul>");

                Arrays.asList(roles).forEach(role -> {
                    out.println("                 <li>" + role + "</li>");
                });
                out.println("           </ul></li>");
                out.println("          <li> Idioma :" + idioma + "</li>");
                out.println("          <li>  Habilitar :" + habilitar + "</li>");
                out.println("          <li>  Secreto : " + secreto + "</li>");
            out.println("</ul>");
            out.println("</body>");
            out.println("</html>");
        }
            } else{
              /*  errores.forEach(error -> {
                    out.println("<li>" + error + "</li>");
                });
                out.println("<p> <a href=\"/Webapp-Form/index.jsp\"> Regresar </a> </p>");
               */
                req.setAttribute("errores", errores);
                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            }
    }
}
