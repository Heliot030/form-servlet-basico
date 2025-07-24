<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.Map"%>
<%
Map<String , String> errores = (Map<String , String>) request.getAttribute("errores");

%>
<!doctype html>
<html lang="" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Formulario de usuarios</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
</head>
<body>
<h3 > Fromulario de usuraios</h3>
<%
if(errores != null && errores.size()>0){
%>
<ul class="alert alert-danger mx-5">
  <%for (String error :errores.values()) {%>
  <li>
    <% out.print(error); %>
  </li>
  <%}%>
</ul>
<%}%>
<div class="px-5">
<form action="/Webapp-Form/registro" method="post">
<div class="row mb-3">
  <label for="username" class="col-form-label col-sm-2"> Usuario </label>
  <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control"
  value="${param.username}"></div>

</div>
  <%
    if(errores != null && errores.containsKey("username")){
      out.println("<div class='row mb-6 alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("username") +
              "</div>" );
    }
  %>
  <div class="row mb-3">
  <label for="password" class="col-form-label col-sm-2"> Contraseña </label>
  <div class="col-sm-4"><input type="text" name="password" id="password" class="form-control"></div>

</div>
  <%
    if(errores != null && errores.containsKey("password")){
      out.println("<div class='row mb-3 alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("password") +
              "</div>" );
    }
  %>
<div class="row mb-3">
  <label for="email" class="col-form-label col-sm-2"> Email </label>
  <div class="col-sm-4 "><input type="text" name="email" id="email" class="form-control"
                                value="${param.email}"></div>

</div>
  <%
    if(errores != null && errores.containsKey("email")){
      out.println("<div class='row mb-3 alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("email")
              + "</div>" );
    }
  %>
  <div class="row mb-3">

      <label for="pais" class="col-form-label col-sm-2"> Pais </label>
      <div class="col-sm-4">
        <select name="pais"id = "pais" class="form-select">
          <option value="">--selecionar ---</option>
          <option value="ES" ${param.pais.equals("ES") ? "select":""}>--Españana ---</option>
          <option value="MX" ${param.pais.equals("MX") ? "select":""}>--Mexico ---</option>
          <option value="CL" ${param.pais.equals("CL") ? "select":""}>--chile ---</option>
          <option value="AR" ${param.pais.equals("AR") ? "select":""}>--Argentina ---</option>
          <option value="PE" ${param.pais.equals("PE") ? "select":""}>--peru ---</option>
          <option value="CO" ${param.pais.equals("CO") ? "select":""}>--colombia ---</option>
          <option value="VE" ${param.pais.equals("VE") ? "select":""}>--Venezuela ---</option>
        </select>
      </div>

    </div>
  <%
    if(errores != null && errores.containsKey("pais")){
      out.println("<div class='row mb-3 alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("pais") +
              "</div>" );
    }
  %>

  <div class="row mb-3">
    <label for="lenguajes" class="col-form-label col-sm-2">  Leonguajes de Progrmacion </label>
    <div class="col-sm-4">
      <select name="lenguajes" id="lenguajes" multiple class="form-select">
        <option value="java" ${paramValues.lenguajes.stream().anyMatch(
                v -> v.equals("java")).get() ? "selected" : ""} >Java SE</option>
        <option value="jakartaee" ${paramValues.lenguajes.stream().anyMatch(
        v -> v.equals("jakartaee")
          ).get() ? "selected" : ""}>Jakarta EE9</option>
        <option value="spring" ${paramValues.lenguajes.stream().anyMatch(
                v -> v.equals("jakartaee")
                ).get() ? "selected" : ""} >Sprint bot</option>
        <option value="js" ${paramValues.lenguajes.stream().anyMatch(
                v -> v.equals("js")
                ).get() ? "selected" : ""} >Javascript</option>
        <option value="angular" ${paramValues.lenguajes.stream().anyMatch(
                v -> v.equals("angular")
                ).get() ? "selected" : ""} >Angular</option>
        <option value="reack" ${paramValues.lenguajes.stream().anyMatch(
                v -> v.equals("reack")
                ).get() ? "selected" : ""} >Reack</option>
      </select>
    </div>

  </div>
  <%
    if(errores != null && errores.containsKey("lenguajes")){
      out.println("<div class='row mb-3 alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("lenguajes") +
              "</div>" );
    }
  %>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2" > Roles </label>
    <div class="form-check col-sm-2">
      <input type="checkbox" name="roles" value="ROLE_ADMIN"
      ${paramValues.roles.stream().anyMatch(
              v -> v.equals("ROLE_ADMIN")
              ).get() ? "checked" : ""}
             class="form-check-input">
      <label class="form-check-label">Administrador</label>
    </div>
    <div class="form-check col-sm-2">
      <input type="checkbox" name="roles" value="ROLE_USER"
         ${paramValues.roles.stream().anyMatch(
              v -> v.equals("ROLE_USER")
              ).get() ? "checked" : ""}
             class="form-check-input">
      <label class="form-check-label">Usuario</label>
    </div>
    <div class="form-check col-sm-2">
      <input type="checkbox" name="roles" value="ROLE_MODERATOR"
      ${paramValues.roles.stream().anyMatch(
              v -> v.equals("ROLE_MODERATOR")
              ).get() ? "checked" : ""}
             class="form-check-input">
      <label class="form-check-label">Moderador</label>
    </div>
    <%
      if(errores != null && errores.containsKey("roles")){
        out.println("<small class='alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("roles") + "</small>" );
      }
    %>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2" > Idiomas</label>
    <div class="form-check col-sm-2">
      <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es")
      ? "checked":""}>
      <label class="form-check-label">Español</label>
    </div>
    <div class="form-check col-sm-2">
      <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en")
              ? "checked":""}>
      <label class="form-check-label">Ingles</label>
    </div>
    <div class="form-check col-sm-2">
      <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr")
              ? "checked":""}>
      <label class="form-check-label">frances</label>
    </div>
    <%
      if(errores != null && errores.containsKey("idioma")){
        out.println("<small class='alert alert-danger col-sm-4' style='color: red' ;>" + errores.get("idioma") + "</small>" );
      }
    %>
  </div>

  <div class="row mb-3">
    <label for="habilitar" class="col-form-label col-sm-2"> Habilitar </label>
    <div class="form-check col-sm-2">
      <input type="checkbox" name="habilitar" id="habilitar" class="form-check-input">
    </div>
  </div>
<div class="row mb-3">
  <div>
    <input type="submit" value="Enviar" class="btn btn-primary">
  </div>
</div>
  <input type="hidden" name="secreto" value="12345">
  </form>
</div>
</body>
</html>
