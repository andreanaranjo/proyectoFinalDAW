<template>
    <div>
        <section>
            <article class="quienesSomos">
                <h2>¿Quiénes somos?</h2>
                <div>
                    <h3>Detalle del curso</h3>
                    <p>El curso <b>Desarrollo de Aplicaciones Web</b> es dictado en la Espol para los estudiantes de la carrera Ing en Ciencias Computacionales, en 2016 es tomada a cargo por el Ing. Allan Avendaño donde ha pasado por una serie de modificaciones para mejorar los resultados del curso.</p>
                    
                    
                    <p>El curso busca con este curso que los estudiantes aprendan la maquetacion y desarrollo de aplicaciones web indistintamente de la tecnología es decir que se adapten a lo que se encuentre usando actualmente en el mercado. </p>
                    
                    <p>El reto principal de los chicos actualmente es el proyecto en el que deben manejar clientes reales y lograr un equilibrio entre las peteciones del cliente y del tutor. <b>Lo que muchas veces no es tan fácil.</b> </p>
                </div>
                
                <div>
                    <h3>Detalle Tutor: Allan Avendaño</h3>
                    <img src="@/assets/aavendano.jpg" id=fotoTutor class="foto">
                    <p>Profesor de la Espol dicta las materias de Desarrollo Web y Fundamentos de Porgramación. Apasionado por la programación y el yoga. Combina academia y deporte, activamente participando en diferentes competencias tanto hackatons o deportivas.</p>
                    
                    <h4> Estudios </h4>
                    <ul>
                        <li> 2014: Magistrale In Ingegneria Informatica (Università degli Studi Roma “La Sapienza”)</li>
                        <li> 2009: Ingeniero En Computación Especialización Sistemas Tecnológicos (ESPOL)</li>
                    </ul>
                    
                    <h4> Experiencia profesional </h4>
                    <ul>
                        <li> Docente Titular Auxiliar Nivel 1: Universidad Politécnica Salesiana (2014 - 2016)</li>
                        <li> Ayudante de Investigación: Centro de Tecnologías de Información (2013 - 2014)</li>
                    </ul>
                </div>
                
                <div>
                    <h3>Detalle Oswaldo Aguilar</h3>
                    <img src="@/assets/OswaldoAguilar.jpg" id=fotoOswaldo class="foto">
                    <p>Estudiante de 21 años de Ingenieria en Ciencias Computacionales, gusta del analisís de datos y de los sistemas de informacion. En su tiempo libre aprende cosas de repostería y practica fútbol o basket. </p>
                    
                    <h4> Enfoque </h4>
                    <ul>
                        <li> Caracterización de Centros Comerciales, plazas, etc.</li>
                        <li> Procesamiento de imagenes médicas.</li>
                        <li> Modelos de detección de enfermedades en radiografías </li>
                        <li> Tracking de usuarios usando redes sociales </li>
                    </ul>
                    
                    <h4> Contacto </h4>
                    <ul>
                        <li> Correo: oswjagui@espol.edu.ec</li>
                        <li> Telefono: 0998978823</li>
                    </ul>
                    
                </div>
                
                <div>
                    <h3>Detalle Andrea Naranjo</h3>
                    <img src="https://via.placeholder.com/150" id=fotoAndrea class="foto">
                    <p>Estudiante de la Carrera de Ingeniería en Ciencias Computacionales. Tiene 22 años y en su timepo libre le gusta escuchar música, ver películas y compartir con su familia </p>
                    
                    <h4> Contacto </h4>
                    <ul>
                        <li> Correo: avnaranj@espol.edu.ec</li>
                        <li> Telefono: 0987907458</li>
                    </ul>
                </div>
            </article>
        </section>
    </div>
</template>

<script>
    export default {
        name: 'AboutPage'
    }
</script>

<style scoped>
    @import 'bootstrap';
    article a{
        color:white;
    }
    article.quienesSomos, article.queHacemos{
        background-color: #00adb5;
        border-radius: 15px; 
        padding-bottom: 10px;
    }
    article.quienesSomos div, article.queHacemos div.divisor_seccion{
        margin: 20px;
        padding:10px;
        border-color: white;
        border-style: solid;
        border-width: 5px;
    }
    
    article.quienesSomos h3, article.queHacemos h3{
        color: #f8b500;
        text-shadow: 2px 0 0 #000, -2px 0 0 #000, 0 2px 0 #000, 0 -2px 0 #000, 1px 1px #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000;
        
    }
    
    article.quienesSomos div img{
        border:1px solid #021a40;
        border-radius:150px;
        padding: 0;
        margin-bottom: 20px;
    }
    
</style>