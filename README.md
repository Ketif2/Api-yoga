[ScriptAsanasMorfemasSQL (1).txt](https://github.com/Ketif2/Api-yoga/files/13601761/ScriptAsanasMorfemasSQL.1.txt)# Posiciones de Yoga - Api-yoga - Yoguismo

Bienvenido a la API de Posiciones de Yoga, un proyecto desarrollado por Software Boys.

## Descripción

Este proyecto proporciona una aplicativo que interactua con el usuario, ayudandole en las búsquedas de: Asanas, Morfemas y categorías de las posturas.

## Características

- Consulta la lista completa de posiciones de yoga con su representación.
- Detalles específicos de cada posición, incluyendo morfemas que la componen y su traducción al español e inglés a partir de la lengua base Sanscrito.

## Tecnologías Utilizadas

- [Lenguaje de Programación]: JAVA
- [Web]: HTML - CSS
- [Base de Datos]: PHPMyAdmin
- [Arquitectura]: MVC

## Instalación

1. Clona este repositorio:

    ```bash
    git clone 'https://github.com/Ketif2/Api-yoga.git'
    ```

3. Configura la base de datos y otros parámetros: Tablas [Asana] y [Morfema]
   
----------INSERT ASANAS------------
INSERT INTO asanas (nombreIngles, nombreEsp, nombreSanscrito, imagenRuta, categoria) 
VALUES 
('Mountain Pose', 'Postura de la Montaña', 'Tadasana', 'img/mountain-pose', 'p'),
('Downward-Facing Dog', 'Perro mirando hacia abajo', 'Adho Mukha Svanasana', 'img/downward-facing-dog', 'p'),
('Warrior I', 'Guerrero I', 'Virabhadrasana I', 'img/warrior-i', 'p'),
('Warrior II', 'Guerrero II', 'Virabhadrasana II', 'img/warrior-ii', 'p'),
('Tree Pose', 'Postura del Árbol', 'Vrikshasana', 'img/tree-pose', 'p'),
('Child''s Pose', 'Postura del Niño', 'Balasana', 'img/childs-pose', 's'),
('Half Cobra Pose', 'Postura de la Cobra a la mitad', 'Ardha Bhujangasana', 'img/half-cobra-pose', 'a'),
('Seated Forward Bend', 'Flexión hacia adelante sentado', 'Paschimottanasana', 'img/seated-forward-bend', 's'),
('Bridge Pose', 'Postura del Puente', 'Setu Bandhasana', 'img/bridge-pose', 'a'),
('Corpse Pose', 'Postura del Cadáver', 'Shavasana', 'img/corpse-pose', 'a'),
('Triangle Pose', 'Postura del Triángulo', 'Trikonasana', 'img/triangle-pose', 'p'),
('Plank Pose', 'Postura de la Plancha', 'Kumbhakasana', 'img/plank-pose', 'a'),
('Upward-Facing Dog', 'Perro mirando hacia arriba', 'Urdhva Mukha Svanasana', 'img/upward-facing-dog', 'a'),
('Fish Pose', 'Postura del Pez', 'Matsyasana', 'img/fish-pose', 'a'),
('Chair Pose', 'Postura de la Silla', 'Utkatasana', 'img/chair-pose', 'p'),
('Garland Pose', 'Postura de la Guirnalda', 'Malasana', 'img/garland-pose', 's'),
('Pigeon Pose', 'Postura de la Paloma', 'Eka Pada Rajakapotasana', 'img/pigeon-pose', 's'),
('Upward Salute', 'Saludo hacia arriba', 'Urdhva Hastasana', 'img/upward-salute', 'p'),
('Revolved Triangle Pose', 'Postura del Triángulo Invertido', 'Parivrtta Trikonasana', 'img/revolved-triangle-pose', 'p'),
('Revolved Head To Knee Pose', 'Postura de la Cabeza a la Rodilla Invertida', 'Parivrtta Janu Sirsasana', 'img/revolved-head-to-knee-pose', 's');

------------INSERT MORFEMAS-------------

INSERT INTO morfemas (nombreMorfema, traduccionEsp) 
VALUES 
('Asana', 'postura'),
('Adho', 'abajo'),
('Ardha', 'mitad'),
('Urdhva', 'arriba'),
('Mukha', 'rostro'),
('Svana', 'perro'),
('Virabhadra', 'guerrero'),
('Vriksha', 'árbol'),
('Bala', 'niño'),
('Bhujanga', 'cobra'),
('Paschi', 'oeste'),
('Setu', 'puente'),
('Shava', 'cadáver'),
('Trikona', 'triángulo'),
('Matsya', 'pez'),
('Mala', 'guirnalda'),
('Eka', 'uno'),
('Pada', 'pie'),
('Raja', 'real'),
('Kapota', 'paloma'),
('Hasta', 'mano'),
('Parivrtta', 'invertido'),
('Janu', 'rodilla'),
('Sirsa', 'cabeza');

## Contribuciones

¡Agradecemos contribuciones! Si deseas mejorar este proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama: `git checkout -b feature/nueva-funcionalidad`.
3. Realiza tus cambios y haz commit: `git commit -m 'Añade nueva funcionalidad'`.
4. Haz push a la rama: `git push origin feature/nueva-funcionalidad`.
5. Abre un pull request.

## Créditos

Este proyecto fue desarrollado por [Software Boys]. Derechos Reservados.


