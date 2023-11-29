<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>YoganismoInc</title>
</head>
<body>

	<%@include file='../templates/banner.html'%>

	<section class="container">
		<div class="container text-center">
			<div class="row">
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Búsqueda por Asana</div>
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/postureController?rute=searchAsana" 
							method="post">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="Introduce Postura en Sancrito" name="sanskritName">
								</div>
							</form>
							<!-- Mostrar mensaje de error si existe -->
							<c:if test="${not empty error}">
								<div class="alert alert-danger mt-3" role="alert">
									<strong>Error:</strong>
									<c:out value="${error}" />
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Búsqueda por Morfema</div>
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/postureController?rute=searchMorfema" 
							method="post">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="Introduce Morfema en Sancrito" name="morfemaName">
								</div>
							</form>
														<!-- Mostrar mensaje de error si existe -->
							<c:if test="${not empty error1}">
								<div class="alert alert-danger mt-3" role="alert">
									<strong>Error:</strong>
									<c:out value="${error1}" />
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Búsqueda por Categoría</div>
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/postureController?rute=searchAsanaByCategory" 
							method="post">
								<!-- Botón dentro del formulario -->
								<button type="submit" name="category" value="p"
									class="btn btn-outline-info">Depie</button>
								<button type="submit" name="category" value="s"
									class="btn btn-outline-info">Sentado</button>
								<button type="submit" name="category" value="a"
									class="btn btn-outline-info">Sedente</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file='../templates/footer.html'%>

	<!-- Agregar los scripts de Bootstrap al final del cuerpo del documento para mejorar el rendimiento -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>


