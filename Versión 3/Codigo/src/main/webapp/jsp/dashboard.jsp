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
			<div class="div_header_structure">
				<div class="div_img">
            		<img class="img" src="${pageContext.request.contextPath}/img/LogoYY.png" alt="">
	            </div>
	            <div class="div_text text-center">
	                <a>Asana Léxico</a>
	            </div>
				<div class="pt-2">
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
							<button type="submit" class="btn btn-success">Crear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-------Section--------->
	<div id="div_busquedas"
		style="background-image: url('../img/backgroundDashboard.webp'); background-size: cover; background-repeat: no-repeat; height: 550px; text-align: center;">
		<!-- Contenido del div, como texto o cualquier otra cosa -->
		<div class="card-body">
			<h1 class="card-title">
				<span class="text-center text-black">Diccionario de Asanas</span>
			</h1>
			<h3 class="card-text .text-secondary-emphasis"> ¡Explora nuestras posturas, encuentra tu práctica perfecta y déjate llevar por la magia del yoga!</h3>
		</div>
	</div>
	<div class="container p-3">
		<div class="container text-center">
			<h1 class="card-title">
				<span class="text-center text-success">BÚSQUEDA POR:</span>
			</h1>
			<div class="row1 mb-5 pb-3">
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Asana</div>
						<div class="card-body">
							<p class="card-text text-success">Ingresa la Asana de la cual quieras conocer más información</p>
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
						<div class="card-header text-light">Morfema</div>
						<div class="card-body">
							<p class="card-text text-success">Ingresa el morfema para conocer su traducción</p>
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
						<div class="card-header text-light">Categoría</div>
						<div class="card-body  mb-3">
							<p class="card-text text-success">Busca las posturas por su categoría</p>
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
	</div>

	<!-------Footer--------->
	<footer class="footer">
		<div>
			<a> © 2023 SoftwareBoys.</a>
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

            input.accept = 'image/*';

            input.onchange = function (e) {
                var rutaImagenConExtension = e.target.value;

                if (esImagen(rutaImagenConExtension)) {
                    var nombreImagenSinExtension = rutaImagenConExtension.replace(/^.*[\\\/]/, '').split('.').slice(0, -1).join('');
                    document.getElementById('rutaImagen').value = 'img/' + nombreImagenSinExtension;
                } else {
                    alert('Por favor, selecciona un archivo de imagen válido.');
                    input.value = '';
                    document.getElementById('rutaImagen').value = ''; 
                }
            };

            input.click();
        }

        function esImagen(nombreArchivo) {
            var extensionesImagen = ['.jpg', '.jpeg', '.png'];
            var extension = nombreArchivo.split('.').pop().toLowerCase();
            return extensionesImagen.includes('.' + extension);
        }
    </script>
</body>
</html>


