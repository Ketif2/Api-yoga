<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<title>YoganismoInc</title>
</head>
<body>
	<header>
		<h1 style="font-size: 2em;">Asociacion Internacional de Yoga
			Yoguismo</h1>
	</header>

	<section class="container">
		<div class="container text-center">
			<div class="row">
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Busqueda por Asana</div>
						<div class="card-body">
							<form action="../postureController?rute=searchAsana"
								method="post">
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										placeholder="Introduce Postura" name="sanskritName">
								</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Busqueda por Morfema</div>
						<div class="card-body">
		
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card text-center">
						<div class="card-header">Busqueda por Categoria</div>
						<div class="card-body">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="bg-dark text-white text-center py-3">
		<p>&copy; 2023 Averos | Becerra | Revelo (Scrum) | Salazar. Todos
			los derechos reservados.</p>
		<div>
			<!-- Redes sociales utilizando iconos de Bootstrap -->
			<a href="#" target="_blank" class="text-white"><i
				class="fab fa-facebook-f"></i></a> <a href="#" target="_blank"
				class="text-white"><i class="fab fa-twitter"></i></a> <a href="#"
				target="_blank" class="text-white"><i class="fab fa-instagram"></i></a>
		</div>
	</footer>

	<!-- Agregar los scripts de Bootstrap al final del cuerpo del documento para mejorar el rendimiento -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>

