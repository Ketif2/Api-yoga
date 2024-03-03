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
            <div class="div_text text-center">
                <a>Asana Léxico</a>
            </div>
        </div>
    </header>
    
	<!-------Section--------->
	<section class="container">
		<div class="card-body mt-5 text-center">
			<p>
				<a href="./index.html"
					class="btn btn-outline-success">Ir al Inicio
				</a>
			</p>
		</div>
		<div class="list-group mt-4 mb-5 pb-3">
			<a class="list-group-item card-header"
				aria-current="true"> <c:out value="${Categoria}" />
			</a>
			<c:forEach var="asana" items="${requestScope.asanasPorCategoria}">
			    <a href="${pageContext.request.contextPath}/postureController?rute=searchAsana&sanskritName=${asana.getNombreEnSans()}" class="list-group-item list-group-item-action">
			        <c:out value="${asana.getNombreEnSans()}" />
			    </a>
			</c:forEach>
		</div>
	</section>
	
	
	<!-------Footer--------->
	<footer class="footer">
        <div>
            <a>
                © 2023 SoftwareBoys.
            </a>
        </div>
    </footer>
</body>
</html>
