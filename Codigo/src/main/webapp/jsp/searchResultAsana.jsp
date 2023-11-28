<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<title>ASANA</title>
</head>
<body>
	<header> </header>

	<div class="container text-center">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<img src="<c:out value="./${rutaImagen}.jpg" />" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">ASANAS</h5>

					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><c:out value="${sancrito}" /></li>
						<li class="list-group-item"><c:out value="${ingles}" /></li>
						<li class="list-group-item"><c:out value="${español}" /></li>	
						<li class="list-group-item active"> <h6>Morfemas Usados</h6> </li>
						<c:forEach var="morfema" items="${morfemas}">
							<c:out value="${morfema.nombreMorfema}"/>:
							<c:out value="${morfema.traduccion}"/>
							<br>
						</c:forEach>	
					</ul>
					<div class="card-body">
						<p><a href="./index.html" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Ir al Inicio</a></p>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<footer class="bg-dark text-white text-center py-3"> </footer>

	<!-- Agregar los scripts de Bootstrap al final del cuerpo del documento para mejorar el rendimiento -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>