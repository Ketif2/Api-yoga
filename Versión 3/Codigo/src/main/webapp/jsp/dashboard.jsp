<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Dancing Script">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<title>YoganismoInc</title>
</head>
<body>
	<!-------Header--------->
	<header>
		<div class="div_header_structure text-center">
			<div class="div_img">
				<img class="img"
					src="${pageContext.request.contextPath}/img/LogoYY.png" alt="">
			</div>
			<div class="div_text mx-auto">
				<span class="text-center">Asana Léxico</span>
			</div>
			<div class="pt-2">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-success pt-2 mb-2"
					data-bs-toggle="modal" data-bs-target="#modalAsana">Agregar
					Asana</button>

			</div>
		</div>
	</header>
	<!-------PopUp--------->
	<div class="modal fade" id="modalAsana" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Agregar
						Asana</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/postureController?rute=guardarAsana"
						method="post">
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Nombre
								Inglés</label> <input type="text" name="nombreEnIngles">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Nombre
								Español</label> <input type="text" name="nombreEnEspanol">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Nombre
								Sánscrito</label> <input type="text" name="nombreEnSans">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Imagen
								Ruta</label>
							<div class="input-group">
								<input type="text" class="form-control" id="rutaImagen"
									name="rutaImagen" readonly>
								<button type="button" class="btn btn-secondary"
									onclick="seleccionarImagen()">Seleccionar Imagen</button>
							</div>
						</div>

						<div class="mb-3">
							<label for="message-text" class="col-form-label">Seleccione
								la categoría:</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="categoria"
								id="inlineRadio1" value="p"> <label
								class="form-check-label" for="inlineRadio1">De pie</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="categoria"
								id="inlineRadio2" value="s"> <label
								class="form-check-label" for="inlineRadio2">Sedente</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="categoria"
								id="inlineRadio1" value="a"> <label
								class="form-check-label" for="inlineRadio1">Decúbito</label>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancelar</button>
							<button type="submit" class="btn btn-primary">Crear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-------Section--------->
	<section class="container">
		<div class="container text-center" id="div_busquedas">
			<div class="row1 mb-5 pb-3">
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Búsqueda por Asana</div>
						<div class="card-body">
							<p class="card-text">Te interesa saber todo de una Asana (posición)
puedes buscarla por el idioma que quieras</p>
							<form
								action="${pageContext.request.contextPath}/postureController?rute=searchAsana"
								method="post">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="Introduce Postura en Sánscrito"
										name="sanskritName">
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
							<p class="card-text">¿Te interesa saber que significa un morfema de tu asana?
Puedes buscarlo aquí</p>
							<form
								action="${pageContext.request.contextPath}/postureController?rute=searchMorfema"
								method="post">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="Introduce Morfema en Sánscrito"
										name="morfemaName">
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
							<p class="card-text">Tenemos 3 categorias que te pueden interesar, es un diccionario de casa asana vistas por una postura</p>
							<form
								action="${pageContext.request.contextPath}/postureController?rute=searchAsanaByCategory"
								method="post">
								<!-- Botón dentro del formulario -->
								<button type="submit" name="category" value="p"
									class="btn btn-outline-info">De pie</button>
								<button type="submit" name="category" value="s"
									class="btn btn-outline-info">Sedente</button>
								<button type="submit" name="category" value="a"
									class="btn btn-outline-info">Decúbito</button>
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
			<a> © 2023 SoftwareBoys. Todos los derechos reservados. </a>
		</div>
	</footer>
	<!-------SCRIPTS--------->
	<script type="text/javascript">const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})
	</script>
	<script>
        function seleccionarImagen() {
            var input = document.createElement('input');
            input.type = 'file';

            // Restringir la selección a archivos de imagen
            input.accept = 'image/*';

            input.onchange = function (e) {
                var rutaImagenConExtension = e.target.value;

                // Verificar si el archivo seleccionado es una imagen
                if (esImagen(rutaImagenConExtension)) {
                    var nombreImagenSinExtension = rutaImagenConExtension.replace(/^.*[\\\/]/, '').split('.').slice(0, -1).join('');
                    document.getElementById('rutaImagen').value = 'img/' + nombreImagenSinExtension;
                } else {
                    // Limpiar el valor del campo si no es una imagen
                    alert('Por favor, selecciona un archivo de imagen válido.');
                    input.value = ''; // Limpiar el valor del input
                    document.getElementById('rutaImagen').value = ''; // Limpiar el campo de texto
                }
            };

            input.click();
        }

        // Función para verificar si la extensión del archivo es una imagen
        function esImagen(nombreArchivo) {
            var extensionesImagen = ['.jpg', '.jpeg', '.png'];
            var extension = nombreArchivo.split('.').pop().toLowerCase();
            return extensionesImagen.includes('.' + extension);
        }
    </script>
</body>
</html>


