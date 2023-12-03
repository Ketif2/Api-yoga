<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Dancing Script">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<title>YoganismoInc</title>
</head>
<body>
	<!-------Header--------->
	<header>
        <div class="div_header_structure">
            <div class="div_img">
                <img class="img" src="${pageContext.request.contextPath}/img/LogoYY.png" alt="">
            </div>
            <div class="div_text">
                <a>Asana Lexico</a>
            </div>
        </div>
    </header>
    
	<!-------Section--------->
	<section class="container">
		<div class="card-body mt-5 text-center">
			<p>
				<a href="./index.html"
					class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Ir al Inicio
				</a>
			</p>
		</div>
		<div class="list-group mt-4 mb-5 pb-3">
			<%-- Primer elemento con translatedCategory --%>
			<a class="list-group-item card-header"
				aria-current="true"> <c:out value="${Categoria}" />
			</a>

			<%-- Itera sobre la lista de asanasPorCategoria --%>
			<c:forEach var="asana" items="${requestScope.asanasPorCategoria}">
				<a href="#" class="list-group-item list-group-item-action"> <c:out
						value="${asana.getNombreEnSans()}" /> <%-- Puedes agregar más detalles de la asana según tus necesidades --%>
				</a>
			</c:forEach>
		</div>
	</section>
	
	
	<!-------Footer--------->
	<footer class="footer">
        <div>
            <a>
                © 2023 Averos (Arquitecto)| Becerra (junior) | Revelo (Scrum) | Salazar (Recontratado). Todos los derechos reservados.
            </a>
        </div>
    </footer>
</body>
</html>
