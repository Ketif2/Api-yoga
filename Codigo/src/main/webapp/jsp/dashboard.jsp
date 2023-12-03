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
                <a>Asana Lexico</a>
            </div>
        </div>
    </header>

	<!-------Section--------->
	
	<section class="container">
		<div class="container text-center" id="div_busquedas">
			<div class="row1 mb-5 pb-3">
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
						<div class="card-header text-light">Búsqueda por Morfema</div>
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
						<div class="card-header text-light">Búsqueda por Categoría</div>
						<div class="card-body  mb-3">
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


