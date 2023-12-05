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
            	<a href="./index.html" > <img class="img" src="${pageContext.request.contextPath}/img/LogoYY.png" alt=""></a>
            </div>
            <div class="div_text text-center">
                <a>Asana Léxico</a>
            </div>
        </div>
    </header>

	<!-------Section--------->
	<section class="container">
		<div class="container text-center mt-5">
			<div class="card-body mt-5 text-center">
				<p>
					<a href="./index.html"
						class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Ir al Inicio
					</a>
				</p>
			</div>
			<div class="row pb-4">
				<div class="col"></div>
				<div class="col mb-5">
					<div class="card mb-3" style="width: 100%;">						
						<div class="card-header">
							<h5>MORFEMA</h5>
						</div>
						<ul class="list-group list-group-flush">
							Sanscrito: <li class="list-group-item"><c:out value="${morfemaSancrito}" /></li>
							Español: <li class="list-group-item"><c:out value="${morfemaEspañol}" /></li>
						</ul>
					</div>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>

	<!-------Footer--------->
	<footer class="footer">
        <div>
            <a>
                © 2023 David Averos (Arquitecto)| Ricardo Becerra (Junior) | Kevin Revelo (Scrum) | Jonathan Salazar (Frontend). Todos los derechos reservados.
            </a>
        </div>
    </footer>

</body>
</html>