<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>

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
		<div class="list-group">
			<%-- Primer elemento con translatedCategory --%>
			<a href="#" class="list-group-item list-group-item-action active"
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
	<div class="card-body">
		<p>
			<a href="./index.html"
				class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Ir
				al Inicio</a>
		</p>
	</div>
	<%@include file='../templates/footer.html'%>

	<!-- Agregar los scripts de Bootstrap al final del cuerpo del documento para mejorar el rendimiento -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
