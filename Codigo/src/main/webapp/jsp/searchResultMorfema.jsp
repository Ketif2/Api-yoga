<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="../css/style.css">
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
				<div class="col"></div>
				<div class="col">
					<div class="card" style="width: 18rem;">						
						<div class="card-body">
							<h5 class="card-title">MORFEMA</h5>
						</div>
						<ul class="list-group list-group-flush">
							Sanscrito: <li class="list-group-item"><c:out value="${morfemaSancrito}" /></li>
							Espa�ol: <li class="list-group-item"><c:out value="${morfemaEspa�ol}" /></li>
						</ul>
						<div class="card-body">
							<p>
								<a href="./index.html"
									class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Ir
									al Inicio</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>

	<%@include file='../templates/footer.html'%>

</body>
</html>