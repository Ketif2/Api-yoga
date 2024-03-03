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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<title>YoganismoInc</title>
</head>
<body>
	<!-------Header--------->
	<header>
		<div class="div_header_structure">
			<div class="div_img">
				<img class="img"
					src="${pageContext.request.contextPath}/img/LogoYY.png" alt="">
			</div>
			<div class="div_text text-center">
				<a>Asana Léxico</a>
			</div>
		</div>
	</header>
	<!-------PopUp--------->
	<div class="modal fade" id="modalAsana" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Editar
						Asana</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/postureController?rute=actualizarAsana"
						method="post">
						<!-- Campo oculto para enviar el ID -->
						<input type="hidden" name="idAsana" value="${id}" />

						<div class="mb-3">
							<label for="message-text" class="col-form-label">Nombre
								Inglés</label> <input type="text" value="<c:out value="${ingles}" />"
								name="nombreEnIngles">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Nombre
								Español</label> <input type="text"
								value="<c:out
									value="${español}" />"
								name="nombreEnEspanol">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Nombre
								Sánscrito</label> <input type="text"
								value="<c:out value="${sancrito}" />" name="nombreEnSans">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Imagen
								Ruta</label>
							<div class="input-group">
								<input type="text" class="form-control" id="rutaImagen"
									value="${rutaImagen}" name="rutaImagen" readonly>
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
							<button type="submit" class="btn btn-success">Crear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-------Section--------->
	<section class="container">
		<div class="container my-4">
			<!-- Centrar el botón de "Ir al Inicio" en su propio contenedor -->
			<div class="d-flex justify-content-center mb-3">
				<a href="./index.html" class="btn btn-outline-success">Ir al
					Inicio</a>
			</div>

			<!-- Botones de "Editar" y "Eliminar" en su propio contenedor, también centrado -->
			<div class="d-flex justify-content-center gap-2 mb-3">
				<!-- Ícono de editar -->
				<button type="button" class="btn btn-info" data-bs-toggle="modal"
					data-bs-target="#modalAsana">
					<i class="fas fa-edit"></i>
				</button>

				<!-- Ícono de eliminar dentro del formulario -->
				<form
					action="${pageContext.request.contextPath}/postureController?rute=eliminarAsana"
					method="post">
					<button type="submit" value="${id}" name="idAsana"
						class="btn btn-danger"
						onclick="return confirm('¿Estás seguro de que deseas eliminar esta Asana?');">
						<i class="fas fa-trash-alt"></i>
					</button>
				</form>
			</div>
			<div class="row pb-4">
				<div class="col"></div>
				<div class="col mb-5 text-center">
					<div class="card mb-3" style="width: 100%;">
						<img src="<c:out value="./${rutaImagen}.jpg" />"
							class="card-img-top" alt="...">
						<div class="card-body card-header">
							<h5 class="card-title">ASANA</h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><c:out
									value="Sánscrito: ${sancrito}" /></li>
							<li class="list-group-item"><c:out value="Inglés: ${ingles}" /></li>
							<li class="list-group-item"><c:out
									value="Español: ${español}" /></li>
							<li class="list-group-item card-header">
								<h6>Morfemas Usados</h6>
							</li>
							<c:forEach var="morfema" items="${morfemas}">
								<li class="list-group-item"><c:out
										value="Sánscrito: ${morfema.nombreMorfema}" /></li>
								<c:out value="Español:" />
								<c:out value="${morfema.traduccionEsp}" />. Ingles:
							<c:out value="${morfema.traduccionIngles}" />
								<br>
							</c:forEach>
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